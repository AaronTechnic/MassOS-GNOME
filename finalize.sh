#!/bin/bash
#
# Finalize the MassOS build. Stage 3 will run this in chroot once the Stage 3
# build is finished.
set -e
# Ensure we're running in the MassOS chroot.
if [ $EUID -ne 0 ] || [ ! -d /sources ]; then
  echo "This script should not be run manually." >&2
  echo "stage3.sh will automatically run it in a chroot environment." >&2
  exit 1
fi
# Set up basic environment variables, still necessary here unfortunately.
. sources/build.env
# Remove leftover junk in /root.
rm -rf /root/.{cache,cargo,cmake}
rm -rf /root/go
# Remove Debian stuff.
# TODO: Find and fix the package(s) causing files to be installed here.
rm -rf /etc/kernel
# Move any misplaced files.
# Emit warnings to remind us to fix the offending packages.
# Be verbose so we can see exactly which files are being relocated.
if [ -d /usr/etc ]; then
  echo "WARNING: Relocating files in /usr/etc to /etc." >&2
  echo "WARNING: Ensure all MassOS packages use the correct sysconfdir." >&2
  cp -rv /usr/etc / >&2
  rm -rf /usr/etc
fi
if [ -d /usr/man ]; then
  echo "WARNING: Relocating files in /usr/man to /usr/share/man." >&2
  echo "WARNING: Ensure all MassOS packages use the correct mandir." >&2
  cp -r /usr/man /usr/share >&2
  rm -rf /usr/man
fi
# Compress manual pages.
# Future version of zman will mandate ZMAN_ALLOW_UNSAFE=1 for working on /usr.
ZMAN_ALLOW_UNSAFE=1 zman /usr/share/man
# Remove static documentation to free up space.
rm -rf /usr/share/doc/*
rm -rf /usr/doc
rm -rf /usr/docs
rm -rf /usr/share/gtk-doc/html/*
# Remove libtool archives.
find /usr/{lib,libexec} -name \*.la -delete
# Remove unwanted Python bytecode cache files in /usr/bin.
# TODO: Determine the offending package(s) and fix them in the build system.
rm -rf /usr/bin/__pycache__
# Remove any temporary files.
rm -rf /tmp/*
# As a finishing touch, run ldconfig and other misc commands.
ldconfig
glib-compile-schemas /usr/share/glib-2.0/schemas
gtk-update-icon-cache -q -t -f --include-image-data /usr/share/icons/hicolor
update-desktop-database
update-mime-database /usr/share/mime
# Last but not least, clean up. Then the build will be ready to go.
cd /
rm -rf /sources
