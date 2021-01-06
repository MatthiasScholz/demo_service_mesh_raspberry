import random
import time
from sense_hat import SenseHat

off = (0, 0, 0)
blue = (0, 0, 255)
red = (255, 0, 0)
green = (0, 255, 0)
yellow = (255, 255, 0)
custom = (0, 160, 50)

def halloFranzi(sense, delay=1):
    fg = green
    bg = blue

    message = "HALLO FRANZI!"
    for l in message:
        letter(l, delay)

    sense.show_message(text_string="_.~\"~._.~\"~._.~\"~._.~\"~._",
                       scroll_speed=0.02,
                       text_colour=fg,
                       back_colour=bg)
    sense.show_message(text_string="Hallo Franzi! :D",
                       text_colour=fg,
                       back_colour=bg)
    time.sleep(delay)
    sense.show_message(text_string="_.~\"~._.~\"~._.~\"~._.~\"~._",
                       scroll_speed=0.02,
                       text_colour=fg,
                       back_colour=bg)

    time.sleep(delay)
    sense.clear()

def sensors(sense):
    h = sense.get_humidity()
    t = sense.get_temperature()

    sense.show_message(text_string=f"Humidity: {h}, Temperature: {t}",
                       text_colour=green,
                       back_colour=blue)
    time.sleep(3)
    sense.clear()

def randomDisplay(sense, runtime_sec=600):
    for s in range(0, runtime_sec):
        x = random.randrange(0,8,1)
        y = random.randrange(0,8,1)

        color = randomColor()
        #color = accelColor(sense)

        sense.set_pixel(x,y,color)
        time.sleep(1)
    sense.clear()

def accelColor(sense):
    base = 1
    accel = sense.get_accelerometer()
    r = int(min(base * accel["pitch"]/255, 255))
    g = int(min(base * accel["roll"]/255, 255))
    b = int(min(base * accel["yaw"]/255, 255))
    print("p: {pitch}, r: {roll}, y: {yaw}".format(**accel))

    return (r,g,b)

def randomColor():
    r = random.randrange(0, 256, 1)
    g = random.randrange(0, 256, 1)
    b = random.randrange(0, 256, 1)

    return (r,g,b)

def letter(letter, delay=2):
    sense.show_letter(s=letter, text_colour=randomColor())
    time.sleep(delay)

def initSense():
    sense = SenseHat()
    sense.clear()
    sense.low_light = True

    sense.set_imu_config(compass_enabled=False,
                         gyro_enabled=False,
                         accel_enabled=True)

    return sense

# MAIN
sense = initSense()

while True:
    halloFranzi(sense)
    sensors(sense)
    randomDisplay(sense)
