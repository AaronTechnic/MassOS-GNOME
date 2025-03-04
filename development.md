# Compilation Instructions for MassOS GNOME:

## GNOME Wallpapers

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-backgrounds/42/gnome-backgrounds-42.0.tar.xz
tar -xf gnome-backgrounds-42.0.tar.xz
cd gnome-backgrounds-42.0
mkdir build && cd build
meson --prefix=/usr
ninja install
cd ..
install -t /usr/share/licenses/gnome-backgrounds -Dm644 COPYING
cd ..
rm -r gnome-backgrounds-42.0
rm gnome-backgrounds-42.0.tar.xz
```
## Install Tracker
```
wget https://ftp.acc.umu.se/pub/gnome/sources/tracker/3.3/tracker-3.3.0.tar.xz
tar -xf tracker-3.3.0.tar.xz
cd tracker-3.3.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/tracker -Dm644 ../COPYING
cd ../..
rm -r tracker-3.3.0
rm tracker-3.3.0.tar.xz
```
## Install LibCloudProviders
```
wget https://ftp.acc.umu.se/pub/gnome/sources/libcloudproviders/0.3/libcloudproviders-0.3.1.tar.xz
tar -xf libcloudproviders-0.3.1.tar.xz
cd libcloudproviders-0.3.1
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/tracker -Dm644 ../LICENSE
cd ../..
rm -r libcloudproviders-0.3.1
rm libcloudproviders-0.3.1.tar.xz
```
## Install GTK4
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gtk/4.6/gtk-4.6.2.tar.xz
tar -xf gtk-4.6.2.tar.xz
cd gtk-4.6.2
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dbroadway-backend=true -Dcolord=enabled -Dsysprof=enabled -Dmedia-gstreamer=enabled -Dmedia-ffmpeg=enabled -Ddemos=false -Dvulkan=enabled -Dtracker=enabled -Dcloudproviders=enabled
ninja
ninja install
install -t /usr/share/licenses/gtk4 -Dm644 ../COPYING
cd ../..
rm -r gtk-4.6.2
rm gtk-4.6.2.tar.xz
```
## Libadwaita
```
wget https://ftp.acc.umu.se/pub/gnome/sources/libadwaita/1.1/libadwaita-1.1.0.tar.xz
tar -xf libadwaita-1.1.0.tar.xz
cd libadwaita-1.1.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/libadwaita -Dm644 ../COPYING
cd ../..
rm -r libadwaita-1.1.0
rm libadwaita-1.1.0.tar.xz
```
## GNOME Text Editor

Install GTK Source View
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gtksourceview/5.4/gtksourceview-5.4.0.tar.xz
tar -xf gtksourceview-5.4.0.tar.xz
cd gtksourceview-5.4.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gtksourceview -Dm644 ../COPYING
cd ../..
rm -r gtksourceview-5.4.0
rm gtksourceview-5.4.0.tar.xz
```

Now, we can install GNOME Text Editor

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-text-editor/42/gnome-text-editor-42.0.tar.xz
tar -xf gnome-text-editor-42.0.tar.xz
cd gnome-text-editor-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-text-editor -Dm644 ../COPYING
cd ../..
rm -r gnome-text-editor-42.0
rm gnome-text-editor-42.0.tar.xz
```

## Calculator

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-calculator/42/gnome-calculator-42.0.tar.xz
tar -xf gnome-calculator-42.0.tar.xz
cd gnome-calculator-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-calculator -Dm644 ../COPYING
cd ../..
rm -r gnome-calculator-42.0
rm gnome-calculator-42.0.tar.xz
```

## System Monitor

Install Libgtop:

```
wget https://ftp.acc.umu.se/pub/gnome/sources/libgtop/2.40/libgtop-2.40.0.tar.xz
tar -xf libgtop-2.40.0.tar.xz
cd libgtop-2.40.0
./configure --prefix=/usr --disable-static
make
make install
install -t /usr/share/licenses/libgtop -Dm644 COPYING
cd ..
rm -r libgtop-2.40.0
rm libgtop-2.40.0.tar.xz
```
Now, we can install System Monitor.

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-system-monitor/42/gnome-system-monitor-42.0.tar.xz
tar -xf gnome-system-monitor-42.0.tar.xz
cd gnome-system-monitor-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-system-monitor -Dm644 ../COPYING
cd ../..
rm -r gnome-system-monitor-42.0
rm gnome-system-monitor-42.0.tar.xz
```
## Totem, GNOME's video player

Install Totem-pl-parser

```
wget https://ftp.acc.umu.se/pub/gnome/sources/totem-pl-parser/3.26/totem-pl-parser-3.26.6.tar.xz
tar -xf totem-pl-parser-3.26.6.tar.xz
cd totem-pl-parser-3.26.6
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/totem-pl-parser -Dm644 ../COPYING.LIB
cd ../..
rm -r totem-pl-parser-3.26.6
rm totem-pl-parser-3.26.6.tar.xz
```

Install GNOME Desktop

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-desktop/42/gnome-desktop-42.0.tar.xz
tar -xf gnome-desktop-42.0.tar.xz
cd gnome-desktop-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dgnome_distributor="MassOS"
ninja
ninja install
install -t /usr/share/licenses/gnome-desktop -Dm644 ../COPYING
cd ../..
rm -r gnome-desktop-42.0
rm gnome-desktop-42.0.tar.xz
```

Install Clutter-gst

```
wget https://ftp.acc.umu.se/pub/gnome/sources/clutter-gst/3.0/clutter-gst-3.0.27.tar.xz
tar -xf clutter-gst-3.0.27.tar.xz
cd clutter-gst-3.0.27
./configure --prefix=/usr
make
make install
install -t /usr/share/licenses/clutter-gst -Dm644 COPYING
cd ..
rm -r clutter-gst-3.0.27
rm clutter-gst-3.0.27.tar.xz
```
Install Grilo

```
wget https://ftp.acc.umu.se/pub/gnome/sources/grilo/0.3/grilo-0.3.14.tar.xz
tar -xf grilo-0.3.14.tar.xz
cd grilo-0.3.14
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/grilo -Dm644 ../COPYING
cd ../..
rm -r grilo-0.3.14
rm grilo-0.3.14.tar.xz
```
Now, we can install Totem.

```
wget https://ftp.acc.umu.se/pub/gnome/sources/totem/42/totem-42.0.tar.xz
tar -xf totem-42.0.tar.xz
cd totem-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/totem -Dm644 ../COPYING
cd ../..
rm -r totem-42.0
rm totem-42.0.tar.xz
```
# File Roller

```
wget https://ftp.acc.umu.se/pub/gnome/sources/file-roller/3.42/file-roller-3.42.0.tar.xz
tar -xf file-roller-3.42.0.tar.xz
cd file-roller-3.42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dpackagekit=false
ninja
ninja install
install -t /usr/share/licenses/file-roller -Dm644 ../COPYING
cd ../..
rm -r file-roller-3.42.0
rm file-roller-3.42.0.tar.xz
```

# Nautilus
Install GNOME Autoar

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-autoar/0.4/gnome-autoar-0.4.3.tar.xz
tar -xf gnome-autoar-0.4.3.tar.xz
cd gnome-autoar-0.4.3
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dvapi=true -Dtests=true
ninja
ninja install
install -t /usr/share/licenses/gnome-autoar -Dm644 ../COPYING
cd ../..
rm -r gnome-autoar-0.4.3
rm gnome-autoar-0.4.3.tar.xz
```
Install Libportal

```
wget https://github.com/flatpak/libportal/releases/download/0.6/libportal-0.6.tar.xz
tar -xf libportal-0.6.tar.xz
cd libportal-0.6
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dbackends=gtk4 -Ddocs=false
ninja
ninja install
install -t /usr/share/licenses/libportal -Dm644 ../COPYING
cd ../..
rm -r libportal-0.6
rm libportal-0.6.tar.xz
```

Now, we can install Nautilus

```
wget https://ftp.acc.umu.se/pub/gnome/sources/nautilus/42/nautilus-42.0.tar.xz
tar -xf nautilus-42.0.tar.xz
cd nautilus-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dselinux=false -Dpackagekit=false
ninja
ninja install
install -t /usr/share/licenses/nautilus -Dm644 ../COPYING
cd ../..
rm -r nautilus-42.0
rm nautilus-42.0.tar.xz
```
## GSound
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gsound/1.0/gsound-1.0.3.tar.xz
tar -xf gsound-1.0.3.tar.xz
cd gsound-1.0.3
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gsound -Dm644 ../COPYING
cd ../..
rm -r gsound-1.0.3
rm gsound-1.0.3.tar.xz
```
## GNOME Bluetooth

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-bluetooth/42/gnome-bluetooth-42.0.tar.xz
tar -xf gnome-bluetooth-42.0.tar.xz
cd gnome-bluetooth-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-bluetooth -Dm644 ../COPYING
cd ../..
rm -r gnome-bluetooth-42.0
rm gnome-bluetooth-42.0.tar.xz
```
## GNOME Session

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-session/42/gnome-session-42.0.tar.xz
tar -xf gnome-session-42.0.tar.xz
cd gnome-session-42.0
sed 's@/bin/sh@/bin/sh -l@' -i gnome-session/gnome-session.in
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-session -Dm644 ../COPYING
mv -v /usr/share/doc/gnome-session{,-42.0}
cd ../..
rm -r gnome-session-42.0
rm gnome-session-42.0.tar.xz
```
## Dconf

```
wget https://ftp.acc.umu.se/pub/gnome/sources/dconf/0.40/dconf-0.40.0.tar.xz
tar -xf dconf-0.40.0.tar.xz
cd dconf-0.40.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/dconf -Dm644 ../COPYING
cd ../..
rm -r dconf-0.40.0
rm dconf-0.40.0.tar.xz
```
## GNOME Shell
Install Evolution Data Server
```
wget https://ftp.acc.umu.se/pub/gnome/sources/evolution-data-server/3.44/evolution-data-server-3.44.0.tar.xz
tar -xf evolution-data-server-3.44.0.tar.xz
cd evolution-data-server-3.44.0
cmake -DCMAKE_INSTALL_PREFIX=/usr   \
      -DSYSCONF_INSTALL_DIR=/etc    \
      -DENABLE_VALA_BINDINGS=ON     \
      -DENABLE_INSTALLED_TESTS=ON   \
      -DENABLE_GOOGLE=ON            \
      -DWITH_OPENLDAP=OFF           \
      -DWITH_KRB5=OFF               \
      -DENABLE_INTROSPECTION=ON     \
      -DWITH_LIBDB=OFF              \
      -DENABLE_WEATHER=OFF
make
make install
install -t /usr/share/licenses/evolution-data-server -Dm644 COPYING
cd ..
rm -r evolution-data-server-3.44.0
rm evolution-data-server-3.44.0.tar.xz
```
GSettings Desktop Schemas
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/42/gsettings-desktop-schemas-42.0.tar.xz
tar -xf gsettings-desktop-schemas-42.0.tar.xz
cd gsettings-desktop-schemas-42.0
sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in &&
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gsettings-desktop-schemas -Dm644 ../COPYING
glib-compile-schemas /usr/share/glib-2.0/schemas
cd ../..
rm -r gsettings-desktop-schemas-42.0
rm gsettings-desktop-schemas-42.0.tar.xz
```
Install Geocode Glib
```
wget https://ftp.acc.umu.se/pub/gnome/sources/geocode-glib/3.26/geocode-glib-3.26.2.tar.xz
tar -xf geocode-glib-3.26.2.tar.xz
cd geocode-glib-3.26.2
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/geocode-glib -Dm644 ../COPYING.LIB
cd ../..
rm -r geocode-glib-3.26.2
rm geocode-glib-3.26.2.tar.xz
```
Install LibGweather
```
pip install typogrify
pip install toml
wget https://ftp.acc.umu.se/pub/gnome/sources/libgweather/4.0/libgweather-4.0.0.tar.xz
tar -xf libgweather-4.0.0.tar.xz
cd libgweather-4.0.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja 
ninja install
install -t /usr/share/licenses/libgweather -Dm644 ../COPYING
cd ../..
rm -r libgweather-4.0.0
rm libgweather-4.0.0.tar.xz
```

Install GNOME Settings Daemon
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-settings-daemon/42/gnome-settings-daemon-42.1.tar.xz
tar -xf gnome-settings-daemon-42.1.tar.xz
cd gnome-settings-daemon-42.1
rm -fv /usr/lib/systemd/user/gsd-*
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dsystemd=true
ninja
ninja install
install -t /usr/share/licenses/gnome-settings-daemon -Dm644 ../COPYING
cd ../..
rm -r gnome-settings-daemon-42.1
rm gnome-settings-daemon-42.1.tar.xz
```
Install Pipewire
```
wget https://github.com/PipeWire/pipewire/archive/0.3.48/pipewire-0.3.48.tar.gz
tar -xf pipewire-0.3.48.tar.gz
cd pipewire-0.3.48
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/pipewire -Dm644 ../COPYING
cd ../..
rm -r pipewire-0.3.48
rm pipewire-0.3.48.tar.gz
```

## Install Mutter
```
wget https://ftp.acc.umu.se/pub/gnome/sources/mutter/42/mutter-42.0.tar.xz
tar -xf mutter-42.0.tar.xz
cd mutter-42.0
sed -i '/libmutter_dep = declare_dependency(/a sources: mutter_built_sources,' src/meson.build
wget https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/xorg-server/trunk/xvfb-run
install -m755 xvfb-run /usr/bin/xvfb-run
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/mutter -Dm644 ../COPYING
cd ../..
rm -r mutter-42.0
rm mutter-42.0.tar.xz
```
## Install Rust temporarily
```
wget https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.gz
tar -xf rust-1.58.1-x86_64-unknown-linux-gnu.tar.gz
cd rust-1.58.1-x86_64-unknown-linux-gnu
sudo ./install.sh --prefix=/usr --sysconfdir=/etc --without=rust-docs
cd ..
```

## Install SpiderMonkey 
```
wget https://archive.mozilla.org/pub/firefox/releases/91.7.1esr/source/firefox-91.7.1esr.source.tar.xz
tar -xf firefox-91.7.1esr.source.tar.xz
cd firefox-91.7.1
mkdir JS91-build; cd JS91-build
if mountpoint -q /dev/shm; then
  beforemounted="true"
else
  mount -t tmpfs devshm /dev/shm
  beforemounted="false"
fi
chmod +x ../js/src/configure.in
SHELL=/bin/sh ../js/src/configure.in --prefix=/usr --with-intl-api --with-system-zlib --with-system-icu --disable-jemalloc --disable-debug-symbols --enable-readline
make -j$(nproc)
make install
rm -f /usr/lib/libjs_static.ajs
sed -i '/@NSPR_CFLAGS@/d' /usr/bin/js91-config
if [ "$beforemounted" = "false" ]; then
  umount /dev/shm
fi
unset beforemounted
install -t /usr/share/licenses/js91 -Dm644 ../../extra-package-licenses/js91-license.txt
cd ../..
rm -r firefox-91.7.1
rm firefox-91.7.1esr.source.tar.xz
```
## Install GJS
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gjs/1.72/gjs-1.72.0.tar.xz
tar -xf gjs-1.72.0.tar.xz
cd gjs-1.72.0
mkdir gjs-build && cd gjs-build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gjs -Dm644 ../COPYING
ln -sfv gjs-console /usr/bin/gjs
cd ../..
rm -r gjs-1.72.0
rm gjs-1.72.0.tar.xz
```
## Install Seahorse
```
wget https://ftp.acc.umu.se/pub/gnome/sources/seahorse/41/seahorse-41.0.tar.xz
tar -xf seahorse-41.0.tar.xz
cd seahorse-41.0
sed -i -r 's:"(/apps):"/org/gnome\1:' data/*.xml
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/seahorse -Dm644 ../COPYING
cd ../..
rm -r seahorse-41.0
rm seahorse-41.0.tar.xz
```
Install iBus
```
wget https://github.com/ibus/ibus/releases/download/1.5.26/ibus-1.5.26.tar.gz
tar -xf ibus-1.5.26.tar.gz
cd ibus-1.5.26
sed -i 's@/desktop/ibus@/org/freedesktop/ibus@g' \
    data/dconf/org.freedesktop.ibus.gschema.xml
./configure --prefix=/usr --sysconfdir=/etc --disable-unicode-dict --disable-emoji-dict
rm -f tools/main.c
make
make install
install -t /usr/share/licenses/ibus -Dm644 ../COPYING
gzip -dfv /usr/share/man/man{{1,5}/ibus*.gz,5/00-upstream-settings.5.gz}
cd ..
rm -r ibus-1.5.26
rm ibus-1.5.26.tar.gz
```

Now, we can install GNOME Shell
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-shell/42/gnome-shell-42.0.tar.xz
tar -xf gnome-shell-42.0.tar.xz
cd gnome-shell-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-shell -Dm644 ../COPYING
cd ../..
rm -r gnome-shell-42.0
rm gnome-shell-42.0.tar.xz
```
## GDM

```
groupadd -g 21 gdm &&
useradd -c "GDM Daemon Owner" -d /var/lib/gdm -u 21 \
        -g gdm -s /bin/false gdm &&
passwd -ql gdm
wget https://ftp.acc.umu.se/pub/gnome/sources/gdm/42/gdm-42.0.tar.xz
tar -xf gdm-42.0.tar.xz
cd gdm-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dplymouth=enabled -Dgdm-xsession=true -Ddefault-pam-config=lfs
ninja
ninja install
install -t /usr/share/licenses/gdm -Dm644 ../COPYING
cd ../..
rm -r gdm-42.0
rm gdm-42.0.tar.xz
```
To set GDM as the default display manager:
`systemctl enable gdm`

## GNOME Terminal

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-terminal/3.43/gnome-terminal-3.43.90.tar.xz
tar -xf gnome-terminal-3.43.90.tar.xz
cd gnome-terminal-3.43.90
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dsearch_provider=true
ninja
ninja install
install -t /usr/share/licenses/gnome-terminal -Dm644 ../COPYING
cd ../..
rm -r gnome-terminal-3.43.90
rm gnome-terminal-3.43.90.tar.xz
```
## Dconf editor (only for me, not for final build)
```
wget https://ftp.acc.umu.se/pub/gnome/sources/dconf-editor/3.38/dconf-editor-3.38.3.tar.xz
tar -xf dconf-editor-3.38.3.tar.xz
cd dconf-editor-3.38.3
sed -e '/  desktop,/d' \
    -e '/  appdata,/d' \
    -i editor/meson.build
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
cd ../..
rm -r dconf-editor-3.38.3
rm dconf-editor-3.38.3.tar.xz
```

## GNOME Tweaks

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-tweaks/42/gnome-tweaks-42.beta.tar.xz
tar -xf gnome-tweaks-42.beta.tar.xz
cd gnome-tweaks-42.beta
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-tweaks -Dm644 ../LICENSES
cd ../..
rm -r gnome-tweaks-42.beta
rm gnome-tweaks-42.beta.tar.xz
```
## GNOME Settings
Install Colord GTK
```
wget https://www.freedesktop.org/software/colord/releases/colord-gtk-0.3.0.tar.xz
tar -xf colord-gtk-0.3.0.tar.xz
cd colord-gtk-0.3.0
mkdir build && cd build
meson --prefix=/usr       \
      --buildtype=release \
      -Dgtk2=true         \
      -Ddocs=false        \
      -Dman=false         \
      -Dvapi=true         
ninja
ninja install
install -t /usr/share/licenses/colord-gtk -Dm644 ../COPYING
cd ../..
rm -r colord-gtk-0.3.0
rm colord-gtk-0.3.0.tar.xz
```
Install Parse-Yapp module
```
wget https://www.cpan.org/authors/id/W/WB/WBRASWELL/Parse-Yapp-1.21.tar.gz
tar -xf Parse-Yapp-1.21.tar.gz
cd Parse-Yapp-1.21
perl Makefile.PL
make
make install
cd ..
rm -r Parse-Yapp-1.21
rm Parse-Yapp-1.21.tar.gz
```
## Install Libnma
```
wget https://ftp.acc.umu.se/pub/gnome/sources/libnma/1.8/libnma-1.8.34.tar.xz
tar -xf libnma-1.8.34.tar.xz
cd libnma-1.8.34
./configure --prefix=/usr --with-libnma-gtk4=yes
make
make install
install -t /usr/share/licenses/libnma -Dm644 COPYING
cd ..
rm -r libnma-1.8.34
rm libnma-1.8.34.tar.xz
```

Now, we can install GNOME Settings
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-control-center/42/gnome-control-center-42.0.tar.xz
tar -xf gnome-control-center-42.0.tar.xz
cd gnome-control-center-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dibus=true
ninja
ninja install
install -t /usr/share/licenses/gnome-control-center -Dm644 ../COPYING
cd ../..
rm -r gnome-control-center-42.0
rm gnome-control-center-42.0.tar.xz
```
# GNOME Characters
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-characters/42/gnome-characters-42.0.tar.xz
tar -xf gnome-characters-42.0.tar.xz
cd gnome-characters-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-characters -Dm644 ../COPYING ../COPYINGv2
cd ../..
rm -r gnome-characters-42.0
rm gnome-characters-42.0.tar.xz
```
# GNOME Calendar
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-calendar/42/gnome-calendar-42.0.tar.xz
tar -xf gnome-calendar-42.0.tar.xz
cd gnome-calendar-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/gnome-calendar -Dm644 ../COPYING
cd ../..
rm -r gnome-calendar-42.0
rm gnome-calendar-42.0.tar.xz
```
## Baobab
```
wget https://ftp.acc.umu.se/pub/gnome/sources/baobab/42/baobab-42.0.tar.xz
tar -xf baobab-42.0.tar.xz
cd baobab-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/baobab -Dm644 ../COPYING ../COPYING.docs
cd ../..
rm -rf baobab-42.0
rm baobab-42.0.tar.xz
```
## Yelp XSL
```
wget https://ftp.acc.umu.se/pub/gnome/sources/yelp-xsl/42/yelp-xsl-42.0.tar.xz
tar -xf yelp-xsl-42.0.tar.xz
cd yelp-xsl-42.0
./configure --prefix=/usr
make install
install -t /usr/share/licenses/yelp-xsl -Dm644 ../COPYING ../COPYING.GPL ../COPYING.LGPL
cd ..
rm -r yelp-xsl-42.0
rm yelp-xsl-42.0.tar.xz
```

## Yelp, GNOME Help program
```
wget https://ftp.acc.umu.se/pub/gnome/sources/yelp/42/yelp-42.0.tar.xz
tar -xf yelp-42.0.tar.xz
cd yelp-42.0
./configure --prefix=/usr --disable-static --with-webkit2gtk-4-0
make
make install
install -t /usr/share/licenses/yelp -Dm644 COPYING
cd ..
rm -r yelp-42.0
rm yelp-42.0.tar.xz
```
## GNOME Software 42
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-software/42/gnome-software-42.0.tar.xz
tar -xf gnome-software-42.0.tar.xz
cd gnome-software-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dfwupd=false -Dpackagekit=false -Dvalgrind=false -Dgsettings_desktop_schemas=enabled -Dman=true -Dpolkit=true -Dflatpak=true -Dsoup2=true
ninja
ninja install
install -t /usr/share/licenses/gnome-software -Dm644 ../COPYING
cd ../..
rm -r gnome-software-42.0
rm gnome-software-42.0.tar.xz
```
## Eye Of GNOME Image Viewer
Exempi
```
wget https://www.paldo.org/paldo/sources/exempi-2.0/exempi-2.1.1.tar.bz2
tar -xf exempi-2.1.1.tar.bz2
cd exempi-2.1.1
./configure --prefix=/usr
make
make install
install -t /usr/share/licenses/exempi -Dm644 ../COPYING
cd ..
rm -r exempi-2.1.1
rm exempi-2.1.1.tar.bz2
```
Eye of GNOME
```
wget https://ftp.acc.umu.se/pub/gnome/sources/eog/42/eog-42.0.tar.xz
tar -xf eog-42.0.tar.xz
cd eog-42.0
sed "/dependency/s@'libportal'@'libportal-gtk3'@" -i meson.build
sed "/portal-gtk3/s@portal/@portal-gtk3/@" -i src/eog-util.c
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dgtk_doc=false
ninja
ninja install
install -t /usr/share/licenses/eog -Dm644 ../COPYING
update-desktop-database
cd ../..
rm -r eog-42.0
rm eog-42.0.tar.xz
```
## Evince 42
```
wget https://ftp.acc.umu.se/pub/gnome/sources/evince/42/evince-42.1.tar.xz
tar -xf evince-42.1.tar.xz
cd evince-42.1
mkdir build && cd build
meson --prefix=/usr --buildtype=release -Dgtk_doc=false -Duser_doc=false
ninja
ninja install
install -t /usr/share/licenses/evince -Dm644 ../COPYING
cd ../..
rm -r evince-42.1
rm evince-42.1.tar.xz
```
## JQ
```
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz
tar -xf jq-1.6.tar.gz
cd jq-1.6
autoreconf -i
./configure --prefix=/usr
make
make install
install -t /usr/share/licenses/jq -Dm644 COPYING
cd ..
rm -r jq-1.6
rm jq-1.6.tar.gz
```
## Chrome GNOME Shell for extension support
```
wget https://ftp.acc.umu.se/pub/gnome/sources/chrome-gnome-shell/10.1/chrome-gnome-shell-10.1.tar.xz
tar -xf chrome-gnome-shell-10.1.tar.xz
cd chrome-gnome-shell-10.1
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_EXTENSION=OFF ../
make install
install -t /usr/share/licenses/chrome-gnome-shell -Dm644 ../LICENSE
cd ../..
rm -r chrome-gnome-shell-10.1
rm chrome-gnome-shell-10.1.tar.xz
```
## GNOME Themes Extra

```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-themes-extra/3.28/gnome-themes-extra-3.28.tar.xz
tar -xf gnome-themes-extra-3.28.tar.xz 
cd gnome-themes-extra-3.28
./configure --prefix=/usr
make
make install
cd ..
rm -r gnome-themes-extra-3.28
rm gnome-themes-extra-3.28.tar.xz 
```
## Cantarell fonts
```
wget https://github.com/AaronTechnic/Cantarell-for-MassOS/raw/main/Cantarell.zip
unzip Cantarell.zip
mv cantarell/ /usr/share/fonts/
rm Cantarell.zip
```

## Tweaks for default user experience

```
tee -a /usr/share/glib-2.0/schemas/10_gnome-shell.gschema.override << END
[org.gnome.shell]
favorite-apps=['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.TextEditor.desktop', 'org.gnome.Characters.desktop', 'org.gnome.Software.desktop']

[org.gnome.desktop.interface]
color-scheme='prefer-dark'
cursor-theme='Adwaita'
document-font-name='Cantarell 11'
font-name='Cantarell 11'
monospace-font-name='Noto Sans Mono Regular 11'
icon-theme='Adwaita'
gtk-theme='Adwaita-dark'

[org.gnome.desktop.wm.preferences]
button-layout='appmenu:minimize,maximize,close'
titlebar-font='Cantarell Bold 11'

[org.gnome.terminal.legacy]
theme-variant='dark'
END
```
## GNOME Tour
```
wget https://ftp.acc.umu.se/pub/gnome/sources/gnome-tour/42/gnome-tour-42.0.tar.xz
tar -xf gnome-tour-42.0.tar.xz
cd gnome-tour-42.0
mkdir build && cd build
meson --prefix=/usr --buildtype=release
ninja
ninja install
install -t /usr/share/licenses/evince -Dm644 ../LICENSE.md
cd ../..
rm -r gnome-tour-42.0
rm gnome-tour-42.0.tar.xz
```

## GDM
```
tee -a /etc/dconf/profile/gdm << END
user-db:user
system-db:gdm
file-db:/usr/share/gdm/greeter-dconf-defaults
END

mkdir /etc/dconf/db/gdm.d/

tee -a /etc/dconf/db/gdm.d/01-logo << END
[org/gnome/login-screen]
logo='/usr/share/massos/massos-logo-extrasmall.png'
END
```
## Fix GTK4 text rendering
```
mkdir /etc/gtk-4.0
tee -a /etc/gtk-4.0/settings.ini << END
[Settings]
gtk-hint-font-metrics=true
END
```
## Final touches
```
update-desktop-database
dconf update
glib-compile-schemas /usr/share/glib-2.0/schemas
systemctl enable gdm
sudo /usr/lib/rustlib/uninstall.sh
```
