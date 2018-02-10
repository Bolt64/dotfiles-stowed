#!/usr/bin/env python3

import json
import subprocess as sp

HISTORY = "/home/sayantan/.workspace_name_history.json"
TOP_N = 300


def get_workspaces():
    proc = sp.Popen(['i3-msg', '-t', 'get_workspaces'], stdout=sp.PIPE)
    output = proc.stdout.read()
    return json.loads(output.decode().strip())


def rename_current_workspace(new_name):
    workspaces = get_workspaces()
    for workspace in workspaces:
        if workspace['focused']:
            number = workspace['num']
            current_name = workspace['name']
            new_name_formatted = "{0}: {1}".format(number, new_name)
            command = ["i3-msg", 'rename workspace "{0}" to "{1}"'.format
                       (current_name, new_name_formatted)]
            sp.Popen(command, stdout=sp.PIPE)
            break


def load_json_log(filename):
    try:
        return json.load(open(filename))
    except FileNotFoundError:
        json.dump({}, open(filename, "w"))
        return json.load(open(filename))


def dump_json_log(log, filename):
    json.dump(log, open(filename, "w"))


def add_name(name, log):
    if name not in log:
        log[name] = 1
    else:
        log[name] += 1
    return log


def sort_by_frequency(log, top_n):
    names = sorted([i for i in log],
                   key=lambda x: log[x],
                   reverse=True
                   )
    return names[:top_n]


if __name__ == "__main__":
    from sys import argv
    if len(argv) > 1:
        new_name = argv[1]
        rename_current_workspace(new_name)
        new_log = add_name(new_name, load_json_log(HISTORY))
        dump_json_log(new_log, HISTORY)
    else:
        log = load_json_log(HISTORY)
        for name in sort_by_frequency(log, TOP_N):
            print(name)
