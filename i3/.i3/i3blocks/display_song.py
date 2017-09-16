#!/usr/bin/env python3

import subprocess as sp

def get_song_details():
    proc = sp.Popen(['audtool', 'current-song'], stdout=sp.PIPE)
    output = proc.stdout.read()
    return output.decode().strip().split(" - ")

def get_playback_status():
    proc = sp.Popen(['audtool', 'playback-status'], stdout=sp.PIPE)
    output = proc.stdout.read()
    return output.decode().strip()

def pretty_print(song_details, line_length = 40):
    try:
        artist, *album, song = song_details
        max_string = " - ".join([song, artist])
        if len(max_string) <= line_length:
            short_string = max_string
        else:
            if len(song) <= line_length:
                short_string = song
            else:
                short_string = song[:line_length - 3] + "..."
        return short_string
    except ValueError:
        return ""

def get_color(playback_status):
    if playback_status == "playing":
        return "#cccccc"
    else:
        return "#11c3cc"

def get_symbol(playback_status):
    if playback_status == "playing":
        return ""
    elif playback_status == "paused":
        return ""
    else:
        return ""

def main(long_line_length, short_line_length):
    long_name = pretty_print(get_song_details(), long_line_length)
    short_name = pretty_print(get_song_details(), short_line_length)
    status = get_playback_status()
    color = get_color(status)
    symbol = get_symbol(status)
    print("{0}   {1}".format(symbol, long_name))
    print("{0}   {1}".format(symbol, short_name))
    print(color)

if __name__=="__main__":
    long_line_length = 70
    short_line_length = 40
    main(long_line_length, short_line_length)
