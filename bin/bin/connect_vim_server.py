#!/usr/bin/env python

from commands import getstatusoutput

def check_session(session):
    _,raw_sessions = getstatusoutput("vim --serverlist")
    sessions = [i.lower() for i in raw_sessions.split()]
    if session.lower() in sessions:
        return True
    else:
        return False

def main(filename):
    return_code,session = getstatusoutput("tmux display-message -p '#S'")
    if return_code==0:
        if check_session(session):
            command = "vim --servername {0} --remote {1}".format(session, filename)
            getstatusoutput(command)
        else:
            print("The session is not running")
    else:
        print("Something very bad happened")

if __name__=="__main__":
    from sys import argv
    if len(argv) <= 1:
        print("You forgot the filename")
    else:
        for filename in argv[1:]:
            main(filename)
