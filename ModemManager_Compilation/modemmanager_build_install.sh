git clone https://gitlab.freedesktop.org/mobile-broadband/ModemManager.git
cd ModemManager
sudo apt install libdbus-1-dev 
meson setup build --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu --sysconfdir=/etc
ninja -C build
sudo ninja -C build install
ModemManager --version


sudo systemctl restart ModemManager.service
