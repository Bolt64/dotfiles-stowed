#!/usr/bin/python

import alsaaudio

def vol_dec(dec=3):
	mixer=alsaaudio.Mixer()
	init_vol=int(mixer.getvolume()[0])
	newvolume=init_vol-dec
	if newvolume<0:
		newvolume=0
	mixer.setvolume(newvolume)

vol_dec()
