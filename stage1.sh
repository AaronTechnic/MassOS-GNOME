#!/bin/bash
#
# Build the environment which will be used to build the full OS later.
set -e
# Disabling hashing is useful so the newly built tools are detected.
set +h
# Ensure retrieve-sources.sh has been run first.
if [ ! -d sources ]; then
  echo "Error: You must run retrieve-sources.sh first!" >&2
  exit 1
fi
# REALLY ensure retrieve-sources.sh has been run and completed first.
if [ "$(find sources -type f | wc -l)" != "$(wc -l < source-urls)" ]; then
  echo "Error: You must ensure all sources downloaded successfully first." >&2
  exit 1
fi
# Starting message.
echo "Starting Stage 1 Build..."
# Setup the environment.
LC_ALL=C
MASSOS="$PWD"/massos-rootfs
PATH="$MASSOS"/root/mbs/stage1/bin:$PATH
CONFIG_SITE="$MASSOS"/usr/share/config.site
export LC_ALL MASSOS MASSOS_TARGET PATH CONFIG_SITE
# Build in parallel using all available CPU cores.
export MAKEFLAGS="-j$(nproc)"
# Compiler flags for MassOS. We prefer to optimise for size.
CFLAGS="-Os"
CXXFLAGS="-Os"
CPPFLAGS=""
LDFLAGS=""
export CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
# Setup the basic filesystem structure (full structure is set up later).
mkdir -p "$MASSOS"/{etc,usr/{bin,lib},var}
# Set up MassOS build system directories (see revamped.md for more info).
mkdir -p "$MASSOS"/root/mbs/{extras,stage1,work}
# Ensure the filesystem structure uses merged usr and merged bin-sbin.
ln -sf usr/bin "$MASSOS"/bin
ln -sf bin "$MASSOS"/usr/sbin
ln -sf usr/bin "$MASSOS"/sbin
ln -sf usr/lib "$MASSOS"/lib
ln -sf lib "$MASSOS"/usr/lib64
ln -sf usr/lib "$MASSOS"/lib64
# Move sources into the temporary environment.
mv sources "$MASSOS"/root/mbs
# Copy patches into the temporary environment.
cp -r patches "$MASSOS"/root/mbs
# Change to the working directory.
pushd "$MASSOS"/root/mbs/work
# Binutils (build 1).
tar -xf ../sources/binutils-2.44.tar.xz
pushd binutils-2.44
mkdir -p build; pushd build
CFLAGS="-O2" CXXFLAGS="-O2" ../configure --prefix="$MASSOS"/root/mbs/stage1 --target=x86_64-stage1-linux-gnu --with-sysroot="$MASSOS" --with-pkgversion="MassOS Binutils 2.44" --enable-default-hash-style=gnu --enable-new-dtags --enable-relro --disable-gprofng --disable-nls --disable-werror
make
make install
popd; popd
rm -rf binutils-2.44
# GCC (build 1).
tar -xf ../sources/gcc-14.2.0.tar.xz
pushd gcc-14.2.0
mkdir -p gmp mpfr mpc isl
tar -xf ../../sources/gmp-6.3.0.tar.xz -C gmp --strip-components=1
tar -xf ../../sources/mpfr-4.2.1.tar.xz -C mpfr --strip-components=1
tar -xf ../../sources/mpc-1.3.1.tar.gz -C mpc --strip-components=1
tar -xf ../../sources/isl-0.27.tar.xz -C isl --strip-components=1
sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
mkdir -p build; pushd build
CFLAGS="-O2" CXXFLAGS="-O2" ../configure --prefix="$MASSOS"/root/mbs/stage1 --target=x86_64-stage1-linux-gnu --with-sysroot="$MASSOS" --with-pkgversion="MassOS GCC 14.2.0" --with-glibc-version=2.41 --with-newlib --without-headers --enable-languages=c,c++ --enable-default-pie --enable-default-ssp --enable-linker-build-id --disable-libatomic --disable-libgomp --disable-libquadmath --disable-libssp --disable-libstdcxx --disable-libvtv --disable-multilib --disable-nls --disable-shared --disable-threads
make
make install
cat ../gcc/{limitx,glimits,limity}.h > "$MASSOS"/root/mbs/stage1/lib/gcc/x86_64-stage1-linux-gnu/14.2.0/install-tools/include/limits.h
popd; popd
rm -rf gcc-14.2.0
# Linux-API-Headers.
tar -xf ../sources/linux-6.13.2.tar.xz
pushd linux-6.13.2
make mrproper
make headers
find usr/include -type f ! -name \*.h -delete
cp -r usr/include "$MASSOS"/usr
install -t "$MASSOS"/usr/share/licenses/linux-api-headers -Dm644 COPYING LICENSES/exceptions/* LICENSES/preferred/*
popd
rm -rf linux-6.13.2
# Glibc.
tar -xf ../sources/glibc-2.41.tar.xz
pushd glibc-2.41
patch -Np1 -i ../../patches/glibc-2.40-vardirectories.patch
mkdir -p build; pushd build
echo "rootsbindir=/usr/bin" > configparms
CFLAGS="-O2" CXXFLAGS="-O2" ../configure --prefix=/usr --host=x86_64-stage1-linux-gnu --build=$(../scripts/config.guess) --with-pkgversion="MassOS Glibc 2.41" --with-headers="$MASSOS"/usr/include --enable-kernel=5.10 --disable-nscd --disable-werror libc_cv_slibdir=/usr/lib
make
make DESTDIR="$MASSOS" install
ln -sf ld-linux-x86-64.so.2 "$MASSOS"/usr/lib/ld-lsb-x86-64.so.3
sed -i '/RTLDLIST=/s@/usr@@g' "$MASSOS"/usr/bin/ldd
popd; popd
rm -rf glibc-2.41
# libstdc++ (from GCC - build 1).
tar -xf ../sources/gcc-14.2.0.tar.xz
pushd gcc-14.2.0
mkdir -p build; pushd build
CFLAGS="-O2" CXXFLAGS="-O2" ../libstdc++-v3/configure --prefix=/usr --host=x86_64-stage1-linux-gnu --build=$(../config.guess) --disable-multilib --disable-nls --disable-libstdcxx-pch --with-gxx-include-dir=/root/mbs/stage1/x86_64-stage1-linux-gnu/include/c++/14.2.0
make
make DESTDIR="$MASSOS" install
rm -f "$MASSOS"/usr/lib/lib{stdc++{,exp,fs},supc++}.la
popd; popd
rm -rf gcc-14.2.0
# Binutils (build 2).
tar -xf ../sources/binutils-2.44.tar.xz
pushd binutils-2.44
sed -i '6031 s/$add_dir //' ltmain.sh
mkdir -p build; pushd build
CFLAGS="-O2" CXXFLAGS="-O2" ../configure --prefix=/usr --host=x86_64-stage1-linux-gnu --build=$(../config.guess) --with-pkgversion="MassOS Binutils 2.44" --enable-64-bit-bfd --enable-default-hash-style=gnu --enable-new-dtags --enable-relro --enable-shared --disable-gprofng --disable-nls --disable-werror
make
make DESTDIR="$MASSOS" install
rm -f "$MASSOS"/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{l,}a
popd; popd
rm -rf binutils-2.44
# GCC (build 2).
tar -xf ../sources/gcc-14.2.0.tar.xz
pushd gcc-14.2.0
mkdir -p gmp mpfr mpc isl
tar -xf ../../sources/gmp-6.3.0.tar.xz -C gmp --strip-components=1
tar -xf ../../sources/mpfr-4.2.1.tar.xz -C mpfr --strip-components=1
tar -xf ../../sources/mpc-1.3.1.tar.gz -C mpc --strip-components=1
tar -xf ../../sources/isl-0.27.tar.xz -C isl --strip-components=1
sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
sed -i '/thread_header =/s/@.*@/gthr-posix.h/' libgcc/Makefile.in libstdc++-v3/include/Makefile.in
mkdir -p build; pushd build
CFLAGS="-O2" CXXFLAGS="-O2" ../configure --prefix=/usr --target=x86_64-stage1-linux-gnu --host=x86_64-stage1-linux-gnu --build=$(../config.guess) --with-build-sysroot="$MASSOS" --enable-languages=c,c++ --with-pkgversion="MassOS GCC 14.2.0" --enable-default-pie --enable-default-ssp --enable-linker-build-id --disable-nls --disable-multilib --disable-libatomic --disable-libgomp --disable-libquadmath --disable-libsanitizer --disable-libssp --disable-libvtv LDFLAGS_FOR_TARGET="-L$PWD/x86_64-stage1-linux-gnu/libgcc"
make
make DESTDIR="$MASSOS" install
ln -sf gcc "$MASSOS"/usr/bin/cc
popd; popd
rm -rf gcc-14.2.0
tar -xf ../sources/upgrade-toolset-20221015-x86_64.tar.xz -C "$MASSOS"/usr/bin --strip-components=1
rm -f "$MASSOS"/usr/bin/LICENSE*
# Change back to the start directory (should be MassOS source tree top-level).
popd
# Remove bootstrap toolchain directory now it is no longer needed.
rm -rf "$MASSOS"/root/mbs/stage1
# Remove temporary system documentation.
# TODO: Try to disable docs in installation of all stage 1 packages.
rm -rf "$MASSOS"/usr/share/{info,man,doc}/*
# Copy boilerplate /etc files into the system.
cp -r utils/etc/. "$MASSOS"/etc
# Rename lsb-release and os-release to /usr/lib, and then create symlinks.
mv "$MASSOS"/etc/{lsb,os}-release "$MASSOS"/usr/lib
cp utils/massos-release "$MASSOS"/usr/lib
ln -sfr "$MASSOS"/usr/lib/massos-release "$MASSOS"/etc/massos-release
ln -sfr "$MASSOS"/usr/lib/os-release "$MASSOS"/etc/os-release
ln -sfr "$MASSOS"/usr/lib/lsb-release "$MASSOS"/etc/lsb-release
# Install MassOS system utilities.
install -t "$MASSOS"/usr/bin -Dm755 utils/programs/{adduser,mass-chroot,massos-snapd,mkinitramfs,mklocales,{un,}zman}
# Install man pages for MassOS system utilities.
install -t "$MASSOS"/usr/share/man/man1 -Dm644 utils/man/man1/*.1
install -t "$MASSOS"/usr/share/man/man8 -Dm644 utils/man/man8/*.8
# Install additional MassOS files.
install -t "$MASSOS"/usr/share/massos -Dm644 LICENSE utils/builtins logo/*.png
# Create MassOS logo symlinks in pixmaps directory.
install -dm755 "$MASSOS"/usr/share/pixmaps
for i in "$MASSOS"/usr/share/massos/*.png; do ln -sfr "$i" "$MASSOS"/usr/share/pixmaps; done
# Install desktop backgrounds.
install -t "$MASSOS"/usr/share/backgrounds -Dm644 backgrounds/*
# Create symlink for Xfce backgrounds (and any other DEs which may need it).
ln -sf . "$MASSOS"/usr/share/backgrounds/xfce
# Install skeleton files into the root user's home directory.
cp -r utils/etc/skel/. "$MASSOS"/root
# Put massos-release source file into the sources directory.
cp utils/programs/massos-release.c "$MASSOS"/root/mbs/sources
# Install build configs for Linux and Busybox.
cp -r utils/build-configs "$MASSOS"/root/mbs/extras
# Copy systemd units into the extras directory so they can be installed later.
cp -r utils/systemd-units "$MASSOS"/root/mbs/extras
# Copy extra package licenses, for packages without a license in their source.
cp -r utils/extra-package-licenses "$MASSOS"/root/mbs/extras
# Copy stage 2 script and environment file into the top-level mbs directory.
cp build-system.sh build.env "$MASSOS"/root/mbs
# If it is an "experimental" build, then date its release.
sed -i "s|experimental|experimental-$(date "+%Y%m%d")|g" "$MASSOS"/usr/lib/massos-release
sed -i "s|experimental|experimental-$(date "+%Y%m%d")|g" "$MASSOS"/usr/lib/os-release
sed -i "s|experimental|experimental-$(date "+%Y%m%d")|g" "$MASSOS"/usr/lib/lsb-release
# Finishing message.
echo -e "\nThe Stage 1 bootstrap system was built successfully."
echo "To build the full MassOS system, now run './stage2.sh' AS ROOT."
# Send a notification to the system if supported.
if notify-send --version &>/dev/null; then
  notify-send -i "$PWD"/logo/massos-logo.png "MassOS Build System" "The Stage 1 build has finished successfully." &>/dev/null || true
fi
