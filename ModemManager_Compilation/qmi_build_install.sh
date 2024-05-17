git clone https://gitlab.freedesktop.org/mobile-broadband/libqmi.git
cd libqmi
sudo apt install libqrtr-glib-dev
meson build --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu
ninja -C build
sudo ninja -C build install