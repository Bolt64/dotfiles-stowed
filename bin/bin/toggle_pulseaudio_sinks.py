#!/usr/bin/env python3

import subprocess as sp
import re
from os import system

sink_change_script = "/home/sayantan/bin/change_pulseaudio_sink.sh"

def get_separated_sink_output():
    proc = sp.Popen(['pacmd', 'list-sinks'], stdout=sp.PIPE)
    output = proc.stdout.read().decode()
    return re.split(r'[\t\n]\s*', output)

def get_current_sink(sink_output):
    for index,line in enumerate(sink_output):
        if line.startswith("* index"):
            return sink_output[index+1][len("name: <"):-1*len(">")]
    return ""

def get_current_sink_index(sink_output):
    for line in sink_output:
        if line.startswith("* index"):
            return int(line.split()[-1])
    return 0

def get_device_speaker_name(sink_output):
    for index,line in enumerate(sink_output):
        if "index: 0" in line:
            return sink_output[index+1][len("name: <"):-1*len(">")]
    return ""

def get_network_speaker_name(sink_output):
    for line in sink_output:
        if line.startswith("name: <") and "USB_PnP_Sound" in line:
            return line[len("name: <"):-1*len(">")]
    return ""

def switch_to_network_speakers(verbose = False):
    sink_out = get_separated_sink_output()
    if verbose:
        system("{0} \"{1}\"".format(sink_change_script, get_network_speaker_name(sink_out)))
    else:
        system("{0} \"{1}\" > /dev/null".format(sink_change_script, get_network_speaker_name(sink_out)))

def switch_to_device_speakers(verbose = False):
    sink_out = get_separated_sink_output()
    if verbose:
        system("{0} \"{1}\"".format(sink_change_script, get_device_speaker_name(sink_out)))
    else:
        system("{0} \"{1}\" > /dev/null".format(sink_change_script, get_device_speaker_name(sink_out)))

def current_status():
    sink_out = get_separated_sink_output()
    if get_current_sink(sink_out) == get_device_speaker_name(sink_out):
        return "device"
    elif get_current_sink(sink_out) == get_network_speaker_name(sink_out):
        return "network"

def toggle(verbose = False):
    if current_status() == 'device':
        switch_to_network_speakers(verbose)
    elif current_status() == 'network':
        switch_to_device_speakers(verbose)

if __name__=="__main__":
    from sys import argv
    if argv[-1] == "-q":
        print(get_current_sink_index(get_separated_sink_output()))
    elif argv[-1] == "-s":
        if current_status() == "network":
            print("Network")
    elif argv[-1] == "-v":
        toggle(True)
    else:
        toggle(False)
