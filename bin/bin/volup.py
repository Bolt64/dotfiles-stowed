#!/usr/bin/python

import alsaaudio

def vol_inc(inc=3):
	mixer=alsaaudio.Mixer()
	init_vol=int(mixer.getvolume()[0])
	newvolume=init_vol+inc
	if newvolume >100 :
		newvolume=100
	mixer.setvolume(newvolume)

vol_inc()
