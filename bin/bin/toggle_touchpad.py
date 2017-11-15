#!/usr/bin/env python3

import subprocess as sp


def get_toggle_status():
    proc = sp.Popen(['synclient'], stdout=sp.PIPE)
    output = proc.stdout.read()
    result_list = output.decode().strip().split("\n")
    for line in result_list[1:]:
        if line.strip().startswith("TouchpadOff"):
            _, str_res = line.split("=")
            return int(str_res.strip())


def get_taptime():
    proc = sp.Popen(['synclient'], stdout=sp.PIPE)
    output = proc.stdout.read()
    result_list = output.decode().strip().split("\n")
    for line in result_list[1:]:
        if line.strip().startswith("MaxTapTime"):
            _, str_res = line.split("=")
            return int(str_res.strip())


def turn_on_touchpad():
    sp.Popen(["synclient", "TouchpadOff=0"])
    sp.Popen(["synclient", "MaxTapTime=100"])
    sp.Popen(["notify-send", "Touchpad on"])


def turn_off_touchpad():
    sp.Popen(["synclient", "TouchpadOff=1"])
    sp.Popen(["notify-send", "Touchpad off"])


def turn_off_tap():
    sp.Popen(["synclient", "MaxTapTime=0"])
    sp.Popen(["notify-send", "Tap to click turned off"])


def cycle_through():
    toggle_status = get_toggle_status()
    tap_status = get_taptime()
    if toggle_status == 1:
        turn_on_touchpad()
    elif tap_status == 0:
        turn_off_touchpad()
    elif toggle_status == 0:
        turn_off_tap()


def toggle_touchpad():
    status = get_toggle_status()
    new_status = 1 - status
    sp.Popen(["synclient", "TouchpadOff={0}".format(new_status)])
    sp.Popen(["notify-send", "Touchpad toggled"])


if __name__ == "__main__":
    cycle_through()
