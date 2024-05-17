git clone https://github.com/mesonbuild/meson.git
cd meson
git checkout tags/1.0.0
sudo apt install python3-setuptools
sudo python3 setup.py install
meson --version