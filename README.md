# Welcome To MassOS
Welcome to **MassOS**, a [free](https://www.gnu.org/philosophy/free-sw.html) GNU/Linux operating system for x86_64 devices, which aims to be minimal and lightweight. It uses the [Xfce](https://xfce.org) desktop environment.
![](massos-desktop-screenshot.png)
The MassOS system itself is under 5 gigabytes. Quite impressive for a GNU/Linux distribution containing a full desktop environment and common programs, as well as development tools/headers. Some distributions are able to achieve minimalism by using smaller replacements for common GNU software, such as musl and busybox, at the cost of some features. With MassOS, you get the minimal size, without compromising the advanced features exclusive to GNU software.
# About This Repo
This repo contains the scripts which are used to build the complete MassOS system. Most people won't want to run these. Instead, you can download the latest release tarball of MassOS from the [releases page](https://github.com/TheSonicMaster/MassOS/releases).
# Is MassOS Based On Any Existing Distro?
No, MassOS is completely independent and compiled from _source_. It does not use a "traditional" package manager (like DPKG or RPM).

The MassOS base system itself already contains a large selection of software which should suit most users. Instead of using a traditional package manager, the universal **Flatpak** package manager (complemented by the GUI Gnome Software centre) can be used to install GUI-based software. AppImages are also supported. Additionally, developer-orientated users may also wish to compile software themselves, since the necessary development tools/headers are retained in the system.
![](software2.png)
# Installing MassOS
Please see the [installation guide](https://github.com/TheSonicMaster/MassOS/blob/main/installation-guide.md) for installation instructions.

Unlike most GNU/Linux distributions, MassOS is not installed from a live CD. Instead, you download the root filesystem tarball and extract/install it manually. The latest release can be found on the [releases page](https://github.com/TheSonicMaster/MassOS/releases). If this seems complicated, don't worry! The [installation guide](https://github.com/TheSonicMaster/MassOS/blob/main/installation-guide.md) has step-by-step instructions on how to install MassOS.

Some developers may also wish to [build MassOS themselves](https://github.com/TheSonicMaster/MassOS/blob/main/building.md) using the scripts in this repo. This is not recommended for most users.
# Releases
The latest release of MassOS is **2021.09.2**.

Release numbers follow the format **YYYY.MM**. For example: the August 2021 release will be **2021.08**. On a working MassOS system, you can check the version by running `cat /etc/massos-release`. There is a new release of MassOS roughly once every 1-2 months. New releases will usually include updated software. A new release in the same month as an existing release will be in the format **YYYY.MM.2**. You can upgrade an existing MassOS installation by extracting the updated rootfs tarball over the existing installation, however do note that this may overwrite any system configuration files you've modified, so it's generally easier and safer to do a fresh installation.

Developers who wish to test out some of the latest and greatest in-development features in MassOS can take a look at the [development branch](https://github.com/TheSonicMaster/MassOS/tree/development).
