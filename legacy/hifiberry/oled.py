from luma.core.interface.serial import spi
from luma.core.render import canvas
from luma.oled.device import ssd1309
import logging
from typing import Dict
from luma.core.sprite_system import framerate_regulator
from threading import Thread
from time import monotonic
from time import sleep
from PIL import ImageFont
from os import path
from upubsub import listen

log = logging.getLogger(__name__)

SCRIPT_DIR = path.dirname(path.realpath(__file__))

# 30 mins, to prevent persistence damage without being annoying
DISPLAY_TIMEOUT = 1800


# TODO https://www.dafont.com/pixellari.font


class Display():
    def __init__(self, params: Dict[str, str] = None):
        serial = spi(device=0, port=0)
        self.device = ssd1309(serial)

        self.volume = 0

        Thread(target=self.render_loop, daemon=True).start()
        Thread(target=self.volume_loop, daemon=True).start()

        self.feed_watchdog()

    # audiocontrol2 hooks
    def notify_async(self, metadata):
        self.metadata = metadata
        self.feed_watchdog()

    def update_volume(self, volume):
        # do nothing -- we get our volume updates from turbovolume.py via
        # upubsub for no delay
        pass
        #self.volume = volume
        #self.feed_watchdog()

    def feed_watchdog(self):
        self.last_update = monotonic()

    def timeout(self):
        return monotonic() - self.last_update > DISPLAY_TIMEOUT

    def render_loop(self):
        font = ImageFont.truetype(path.join(SCRIPT_DIR, "/usr/share/fonts/dejavu/DejaVuSansMono.ttf"), 14)
        fontbig = ImageFont.truetype(path.join(SCRIPT_DIR, "/usr/share/fonts/dejavu/DejaVuSansMono.ttf"), 40)
        while True:
            with framerate_regulator(30):
                with canvas(self.device) as draw:
                    draw.rectangle(
                        self.device.bounding_box, outline="white", fill="black"
                    )
                    draw.text((40, 6), "VOLUME", font=font, fill="white")
                    draw.text(
                        (15, 20),
                        f"{self.volume: >3.0f}%",
                        font=fontbig,
                        fill="white",
                    )

                if self.timeout():
                    self.device.clear()
                    # respond immediately
                    while self.timeout():
                        sleep(0.01)

    def volume_loop(self):
        for channel, obj in listen():
            if channel == "volume":
                self.volume = int(obj)
                self.feed_watchdog()
