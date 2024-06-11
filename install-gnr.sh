#!/bin/bash -i
## update and upgrade
sudo apt-get -y update && sudo apt-get -y upgrade

## git install
sudo apt-get install git

## make direcotires if they doesnt exist
mkdir $INSTALLPREFIX
mkdir ~/rfdev
mkdir ~/rfdev/workarea

## clone gnuradio 3.8
cd ~/rfdev/workarea
rm -rf gnuradio
git clone --recursive -b maint-3.8 https://github.com/gnuradio/gnuradio.git

## install deps
sudo apt install -y git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy \
python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev \
libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 \
liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins \
python3-zmq python3-scipy python3-gi python3-gi-cairo gir1.2-gtk-3.0 \
libcodec2-dev libgsm1-dev libusb-1.0-0 libusb-1.0-0-dev libudev-dev python3-setuptools 

## build and install
cd ~/rfdev/workarea/gnuradio
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/gnuradio3.8-$UHDVER ..
make -j4
sudo make install
