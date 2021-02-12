#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap
scim=/usr/bin/scim
ibus=/usr/bin/ibus-daemon
gpgagent=/usr/bin/gpg-agent

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start ibus for all users
# if [ -f $ibus ]; then
# 	export XMODIFIERS="@im=ibus"
# 	export GTK_IM_MODULE="ibus"
# 	export QT_IM_MODULE="xim"
# 	ibus-daemon -d -x
# # start scim for all users
# elif [ -f $scim ]; then
# 	export XMODIFIERS=@im=SCIM
# 	export GTK_IM_MODULE=scim
# 	export QT_IM_MODULE=scim
# 	scim -d
# fi

# start gpg pinentry for all users
if [ -f $gpgpagent ]; then
	eval "$(gpg-agent --daemon)"
fi

# start some nice programs
if [ -n "`/etc/X11/chooser.sh`" ]; then
	command="`/etc/X11/chooser.sh`"
else
	command="XTERM -geometry 80x66+0+0 -name login"
	failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets)
#
# You probably need to do this too:
export GPG_AGENT_INFO GNOME_KEYRING_CONTROL GNOME_KEYRING_PID

if [ $failsafe = "yes" ]; then
	#xscreensaver -no-splash &
	#kmix &
	#rxvt-unicode &
	#gvim &
	#firefox &
	xcompmgr &
	#exec ck-launch-session startkde
	exec dbus-launch awesome
	#exec gnome-session
	#exec xfce4-session
fi
exec $command
