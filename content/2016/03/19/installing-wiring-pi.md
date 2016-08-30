+++
Categories = ["Development", "Python", "Raspberry Pi", "Bot"]
Description = ""
Tags = ["Development", "Python", "Raspberry Pi", "Bot"]
date = "2016-03-19T11:14:20+10:00"
draft = true
menu = "main"
title = "installing wiring pi"

+++

I want to giving [Wiring Pi](http://wiringpi.com/) a shot while
experimenting sending variable amounts of power to motors that I'm
driving from a Rasperry Pi.

The Python [RPIO](http://pythonhosted.org/RPIO/pwm_py.html) library
only seems to expose HIGH and LOW (ON, or OFF). In my case I want to be able to power motors at less than 100%.

```
sudo apt-get install wiringpi python-dev
sudo pip install wiringpi2
```
