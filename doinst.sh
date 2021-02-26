# Post-install configuration scripts, borrowed from the fail2ban
# Slackbuild: 

config() {
	NEW="$1"
	OLD="$(dirname $NEW)/$(basename $NEW .new)"
	# If there's no config file by that name, mv it over:
	if [ ! -r $OLD ]; then
		mv $NEW $OLD
	elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
		# toss the redundant copy
		rm $NEW
	fi
	# Otherwise, we leave the .new copy for the admin to consider...
}

config etc/gpib.conf.new
config etc/udev/rules.d/99-agilent_82357a.rules.new
config etc/udev/rules.d/99-ni_usb_gpib.rules.new
config etc/udev/rules.d/99-lpvo_usb_gpib.rules.new
config etc/udev/rules.d/98-gpib-generic.rules.new

# We skipped `depmod` in `make modules_install`, do it now
/sbin/depmod -A
