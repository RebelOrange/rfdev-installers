#!/bin/bash -i
## update and upgrade
sudo apt-get -y update && sudo apt-get -y upgrade

## git install
sudo apt-get install git

## UHD install
# prep folders
mkdir /opt/gnuradio3.8-$UHDVER
mkdir ~/workarea
mkdir ~/rfdev
mkdir ~/hls-blocks

# clone UHD into workarea folder
# from uhd github
cd ~/workarea
rm -rf uhd # remove any previously cloned uhd
git clone -b $UHDVER https://github.com/EttusResearch/uhd.git

# from rfdev github


# install uhd deps (added dpdk and dpdk-dev to default install deps)
sudo apt-get install -y autoconf automake build-essential ccache cmake cpufrequtils doxygen ethtool \
g++ git inetutils-tools libboost-all-dev libncurses6 libncurses-dev libusb-1.0-0 libusb-1.0-0-dev \
libusb-dev python3-dev python3-mako python3-numpy python3-requests python3-scipy python3-setuptools \
python3-ruamel.yaml dpdk dpdk-dev libdpdk-dev 

## install dpdk version from source, need to a
#sudo apt install -y meson ninja
#cd ~/workarea
#wget https://fast.dpdk.org/rel/dpdk-21.11.7.tar.xz
#tar -xf dpdk-*
#cd dpdk-stable*
#meson build
#cd build
#ninja -C -j 4 build && sudo ninja install

# build from source and install
cd ~/workarea/uhd/host
mkdir build && cd build
rm -rf *
cmake -DCMAKE_INSTALL_PREFIX=/opt/gnuradio3.8-$UHDVER -DCMAKE_CXX_COMPILER=/usr/bin/gcc-11 ..
make -j4
sudo make install

