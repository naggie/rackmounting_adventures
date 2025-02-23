"""
Special rotary evdev based volume controller optimised for rate-limited updates.
Publishes volume to an out-of-band channel to bypass slow updates.
Uses absolute volume control, so has to keep/assert volume by itself.
"""
from threading import Thread
from threading import Event
from typing import Dict
import evdev
import logging
from time import monotonic
from time import sleep
from upubsub import publish

log = logging.getLogger()


class Controller(Thread):
    def __init__(self, params: Dict[str, str] = None):
        super().__init__()
        self.volumecontrol = None
        self.playercontrol = None
        self.name = "Rotary controller"
        self.dev = evdev.InputDevice("/dev/input/by-path/platform-rotary@4-event")

        log.info("Rotary encoder device: %s", self.dev.name)

        # last volume reported by knob or updated by alsa reported volume after
        # a delay -- local knob has precedence
        self.volume = 0

        # event set when rotary encoder moves. Used to set system volume, rate
        # limited.
        self.local_change = Event()
        self.last_change = 0

        # TODO make thread runner util to keep these threads alive
        Thread(target=self.read_loop, daemon=True).start()
        Thread(target=self.write_loop, daemon=True).start()

    # audiocontrol2.py hooks
    def set_volume_control(self, volumecontrol):
        self.volumecontrol = volumecontrol
        self.volumecontrol.add_listener(self)
        self.volume = self.volumecontrol.current_volume()
        publish("volume", self.volume)

    def set_player_control(self, playercontrol):
        self.playercontrol = playercontrol

    def __str__(self):
        return self.name

    # alsavolume.py listener hook (not run in thread)
    def update_volume(self, vol):
        if monotonic() - self.last_change > 2.0:
            self.volume = vol

            # publish on channel for oled display
            publish("volume", vol)

    def read_loop(self):
        for e in self.dev.read_loop():
            log.debug("Event: %s", e)
            if e.type == evdev.ecodes.EV_REL:

                # update local volume in one go
                vol = self.volume
                vol += e.value
                vol = min(vol, 100)
                vol = max(vol, 0)
                self.volume = vol

                self.local_change.set()

                # publish on channel for oled display, unthrottled
                publish("volume", vol)

    def write_loop(self):
        # set the volume throttled to twice per second. Any faster, and
        # alsavolume.py queues the changes up...
        while True:
            self.local_change.wait()
            self.local_change.clear()
            self.last_change = monotonic()
            self.volumecontrol.set_volume(self.volume)
            sleep(0.5)
