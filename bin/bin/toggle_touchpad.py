#!/usr/bin/env python3

import subprocess as sp

def get_toggle_status():
    proc = sp.Popen(['synclient'], stdout=sp.PIPE)
    output = proc.stdout.read()
    result_list = output.decode().strip().split("\n")
    for line in result_list[1:]:
        if line.strip().startswith("TouchpadOff"):
            _,str_res = line.split("=")
            return int(str_res.strip())

def toggle_touchpad():
    status = get_toggle_status()
    new_status = 1 - status
    sp.Popen(["synclient", "TouchpadOff={0}".format(new_status)])
    sp.Popen(["notify-send", "Touchpad toggled"])

if __name__=="__main__":
    toggle_touchpad()
