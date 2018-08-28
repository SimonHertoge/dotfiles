# Setup

Steps to create a perfect install:
1. **Complete the [installation guide](https://wiki.archlinux.org/index.php/installation_guide)**
1. **[Install](https://wiki.archlinux.org/index.php/Makepkg#Usage) [yay](https://aur.archlinux.org/packages/yay/)**
1. **Download `packages.list` and install with `yay -S - < packages.list`**
1. Configure [Mutt](https://github.com/LukeSmithxyz/mutt-wizard/)
1. **Clone this repo**
1. **Change network and audio interfaces in `.config/polybar/config`**
1. Configure personal files
    - `.mpdscribble/mpdscribble.config`
    - `scripts/libs/lastfm_credentials.py`
    - `scripts/libs/shazam.conf`
    - `.calcurse/caldav/config`
1. Modify paths in various scripts where necessary
1. Install bad proprietary drivers (in my case):
    - mt7610u_wifi_sta-alt
    - cnijfilter-mx340
1. [Symlink Microsoft fonts](https://wiki.archlinux.org/index.php/Microsoft_fonts#Using_fonts_from_a_Windows_partition)
1. Modify [fstab](https://wiki.archlinux.org/index.php/Fstab)
1. Install [power management](https://wiki.archlinux.org/index.php/Power_management) and [video drivers](https://wiki.archlinux.org/index.php/xorg#Driver_installation)
