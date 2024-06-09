#!/bin/bash -i
## add if grep statement to see if the RFNoC settings are already there

echo '

# ------------------ RFNoC settings --------------------
UHDVER=UHD-4.6
INSTALLPREFIX=/opt/gnuradio3.8-$UHDVER
RFDEVPREFIX=~/rfdev/

export PATH=$PATH:$INSTALLPREFIX:$INSTALLPREFIX/bin
export LD_LOAD_LIBRARY=$INSTALLPREFIX/lib:$LD_LOAD_LIBRARY
export LD_LIBRARY_PATH=$INSTALLPREFIX/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$INSTALLPREFIX/lib/python3.10/site-packages:$PYTHONPATH
export PYTHONPATH=$INSTALLPREFIX/lib/python3/dist-packages:$PYTHONPATH
export PKG_CONFIG_PATH=$INSTALLPREFIX/lib/pkgconfig:$PKG_CONFIG_PATH
export UHD_RFNOC_DIR=$INSTALLPREFIX/share/uhd/rfnoc/
export UHD_IMAGES_DIR=$INSTALLPREFIX/share/uhd/images
export UHD_FPGA_DIR=$REPOPREFIX/fpga
export UHD_REPO_DIR=$REPOPREFIX
export ETTUS_LIBRARIES=$INSTALLPREFIX/lib
export ETTUS_INCLUDE_DIRS=$INSTALLPREFIX/include

# -------------------- Xilinx settings ---------------------------------
export PATH=$PATH:/opt/Xilinx/Vitis_HLS/2023.2/bin/
export PATH=$PATH:/opt/Xilinx/Vivado/2021.1/bin/
alias vitis="/opt/Xilinx/Vitis_HLS/2023.2/bin/vitis_hls"' >> ~/.bashrc

source ~/.bashrc


