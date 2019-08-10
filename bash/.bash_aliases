#This is the bash aliases file.
# All aliases should be placed here.

#Command to display core temperatures.
alias temp='acpi -t'

#Command to check network connection
alias checknet='ping -c 10 www.google.com'

#Wireless link quality
alias quality="iwconfig 2> /dev/null |sed -n '/Link/p' | awk '{print $2}'"

#Reliable file downloading
alias wgetc="wget -c -t inf"

#Verbose rsync
alias rsync="rsync -v"

#Checking up definitions on google
alias define="web_search.py define"

#Default search provider
alias google="web_search.py"

#Sensible mkdir
alias mkdir="mkdir -v"

# git add all new stuff
alias addall="git add -A"
alias commit="git commit -a"

# Alias for ipython3
alias ipy="/usr/bin/ipython3"

# Alias for setting and unsetting proxies
#alias proxy_set="source /home/bolt/Code/configs/proxy_settings_iiscwlan"
#alias unset_proxy="source /home/bolt/Code/configs/proxy_settings_other"

# User level shutdown
alias ushutdown="/usr/bin/dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop"
alias ureboot="/usr/bin/dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart"

# tmux unicode support
alias tmux="tmux -u"

# Clipboard
alias cclip="xclip -selection clipboard"
alias pclip="xclip -o -selection clipboard"

# vim server
alias vim_serve="(python2 /home/bolt/bin/start_vim_server.py &)"
alias svim="python2 /home/bolt/bin/connect_vim_server.py"

# Searching for processes
alias findproc="ps aux | grep "

# Pulse Audio sink changing aliases
#alias enableLaptopSpeakers="change_pulseaudio_sink.sh \"alsa_output.pci-0000_00_1b.0.analog-stereo\""
#alias enableRasPiSpeakers="change_pulseaudio_sink.sh \"tunnel.raspberrypi.local.alsa_output.usb-C-Media_Electronics_Inc._USB_PnP_Sound_Device-00-Device.analog-stereo\""

# Wake up laptop
#alias wakeLaptop="wol 10:1f:74:c3:2d:b6"

# Alias rsync to cpr
alias cpr="rsync -a --info=progress2"

# Alias emacsclient
alias ec="emacsclient -n -c"

# youtube-dl mp3
alias yoump3="youtube-dl --extract-audio --audio-format mp3 -l"

# clean up files after installation
alias cleanup="yes | trizen -Scc"

# alias mutt
#alias mutt="neomutt"

# Aliases for VPN
alias up_vpn="sudo wg-quick up wg0-client"
alias down_vpn="sudo wg-quick down wg0-client"
