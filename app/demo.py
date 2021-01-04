from sense_hat import SenseHat
sense = SenseHat()

blue = (0, 0, 255)
red = (255, 0, 0)
green = (0, 255, 0)
yellow = (255, 255, 0)

sense .set_pixel(0, 2, blue)
sense.set_pixel(7, 4, red)
sense.set_pixel(3, 6, green)
sense.set_pixel(1, 5, yellow)
