git clone https://gitlab.freedesktop.org/mobile-broadband/libmbim.git
cd libmbim
sudo apt install help2man
meson build --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu
ninja -C build
sudo ninja -C build install
mbimcli --version