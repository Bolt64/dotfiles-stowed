#!/usr/bin/env python3

import os

def get_song():
    command = "audtool --current-song"
    return os.popen(command).read()

def parse_song(string):
    try:
        artist,_,song = string.strip().split(" - ")
        return (song, artist)
    except ValueError:
        return ("1",)

def pretty_print(song):
    try:
        return "{0} - {1} |".format(song[1], song[0])
    except Exception:
        return ""

def main():
    string = get_song()
    print(pretty_print(parse_song(string)))

if __name__=="__main__":
    main()
