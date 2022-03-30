import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(4,GPIO.OUT)
GPIO.setup(18,GPIO.OUT)
GPIO.setup(26,GPIO.OUT)
GPIO.setup(12,GPIO.OUT)
GPIO.setup(23,GPIO.OUT)
GPIO.output(12,1) #external
time.sleep(5)
GPIO.output(18,1) #up-left
time.sleep(2)
GPIO.output(26,1) #lower-left
time.sleep(5)
GPIO.output(23,1) #lower-right
time.sleep(2)
GPIO.output(4,1) #up-right
