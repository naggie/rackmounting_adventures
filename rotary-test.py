# Rotary encoder using evdev
# Add to /boot/config.txt
#  dtoverlay=rotary-encoder,pin_a=20,pin_b=21,relative_axis=1,steps-per-period=2
# Tweak pins and steps to match the encoder

import evdev

d = evdev.InputDevice('/dev/input/by-path/platform-rotary@4-event')

print('Rotary encoder device: {}'.format(d.name))

position = 0

for e in d.read_loop():
    print('Event: {}'.format(e))
    if e.type == evdev.ecodes.EV_REL:
        position += e.value
        print('Position: {}'.format(position))
