#!/usr/bin/env python3

import i3


def get_current_workspace():
    workspaces = i3.get_workspaces()
    for workspace in workspaces:
        if workspace['focused']:
            return workspace['num']


def get_next_workspace(current_workspace):
    return ((current_workspace % 10) + 1)


def goto_next_workspace():
    current_workspace = get_current_workspace()
    i3.command('workspace number {0}'.format(
        get_next_workspace(current_workspace)))


if __name__ == "__main__":
    goto_next_workspace()
