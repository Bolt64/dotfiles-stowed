#!/usr/bin/env python

import subprocess as sp

def get_sink_output():
    command = ["pacmd", "list-sinks"]
    proc = sp.Popen(command, stdout=sp.PIPE)
    output = proc.stdout.read().decode().strip().split("\n")
    return [i.strip() for i in output]

def get_sink_inputs():
    command = ["pacmd", "list-sink-inputs"]
    proc = sp.Popen(command, stdout=sp.PIPE)
    output = proc.stdout.read().decode().strip().split("\n")
    return [i.strip() for i in output]

def parse_sink_output(sink_output):
    sinks = {}
    current_sink = -1
    active_sink = None
    for line in sink_output:
        if "index" in line:
            current_sink = parse_index_line(line)
            if "*" in line:
                active_sink = current_sink
        elif "device.description" in line:
            device_description = parse_device_description(line)
            sinks[current_sink] = device_description
    return sinks, active_sink

def parse_sink_inputs(sink_inputs):
    inputs = []
    for line in sink_inputs:
        if "index" in line:
            inputs.append(parse_index_line(line))
    return inputs

def parse_index_line(index_line):
    predicate = lambda x: x in "1234567890"
    return int("".join(filter(predicate, index_line)))

def parse_device_description(description_line):
    prefix = "device.description = \""
    suffix = "\""
    return description_line[len(prefix):-1*len(suffix)]

def select_sink(index, active_inputs):
    set_default_command = ["pacmd", "set-default-sink", str(index)]
    input_move_commands = [["pacmd", "move-sink-input", str(input_source), str(index)] for input_source in active_inputs]
    sp.Popen(set_default_command, stdout=sp.PIPE)
    for command in input_move_commands:
        sp.Popen(command, stdout=sp.PIPE)

def list_sinks():
    sinks, active_sink = parse_sink_output(get_sink_output())
    for i in range(len(sinks)):
        if i != active_sink:
            print("{0}: {1}".format(i, sinks[i]))
        else:
            print("{0}: (active) {1}".format(i, sinks[i]))

def parse_choice(choice):
    return int(choice.split(":")[0])

if __name__=="__main__":
    from sys import argv
    if len(argv) <= 1:
        list_sinks()
    else:
        index = parse_choice(argv[1])
        active_inputs = parse_sink_inputs(get_sink_inputs())
        select_sink(index, active_inputs)

