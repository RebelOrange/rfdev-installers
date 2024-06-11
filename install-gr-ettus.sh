#!/bin/bash -i
cd ~/rfdev/workarea
rm -rf gr-ettus
git clone -b maint-3.8-uhd4.0 https://github.com/EttusResearch/gr-ettus.git

cd ~/rfdev/workarea/gr-ettus
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$INSTALLPREFIX ..
make -j4
sudo make install
