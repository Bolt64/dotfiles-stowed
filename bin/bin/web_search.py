#!/usr/bin/python

from sys import argv,exit
from os import system

if __name__=='__main__':
	args=argv[1:]
	search_string=str()
	search_target='web'
	optional_data=[]
	main_command='xdg-open 2>/dev/null '


	if (args[0]=='-t') | (args[0]=='--text-only'):
		main_command='lynx'
		args.remove(args[0])

	if args[0].startswith('-'):
		if (args[0]=='-w') | (args[0]=='--web'):
			search_target='web'
			args.remove(args[0])
		elif (args[0]=='-i') | (args[0]=='--images'):
			search_target='images'
			args.remove(args[0])
		elif (args[0]=='-s') | (args[0]=='--site'):	
			search_target='sites'
			args.remove(args[0])
			optional_data.append(args[0])
			args.remove(args[0])
		elif (args[0]=='-wi') | (args[0]=='--wikipedia'):
			search_target='wikipedia'
			args.remove(args[0])
		else:
			exit(2)
	
	for arg in args:
		if args.index(arg)==0:
			search_string=search_string+str(arg)
		else:
			search_string=search_string+'+'+str(arg)

	if search_target=='web':
	#	print('web')
#		system('xdg-open http://www.google.com/search?q='+search_string)
		system('%s http://www.google.com/search?q=%s' % (main_command, search_string))
	elif search_target=='images':
	#	print('images')
#		system('xdg-open http://www.google.com/search?q='+search_string+'\&tbm=isch')
		system('%s http://www.google.com/search?q=%s\&tbm=isch' % (main_command, search_string))
	elif search_target=='sites':
		system('xdg-open http://www.google.com/search?q='+'['+search_string+':\ '+optional_data[0]+']')
	elif search_target=='wikipedia':
		system('xdg-open http://en.wikipedia.org/w/index.php?search='+search_string)	
