#/usr/bin/env sh

tar cvf linux-gpib.tar --transform "s|^./|linux-gpib/|g" --exclude=".git*" --exclude="create_slackbuild_archive.sh" .
gzip linux-gpib.tar