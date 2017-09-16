#!/usr/bin/env python

from commands import getstatusoutput

def main(terminal=False, session=None):
    if not session:
        return_code,session = getstatusoutput("tmux display-message -p '#S'")
        if return_code!=0:
            print("Something bad happened.")
    if return_code==0:
        if terminal:
            command = "vim --servername {0}".format(session)
        else:
            command = "gvim --servername {0}".format(session)
        print(command)
        getstatusoutput(command)

if __name__=="__main__":
    from sys import argv
    if argv[-1]=="-t":
        main(terminal=True)
    else:
        main(terminal=False)
