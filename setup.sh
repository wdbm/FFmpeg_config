#!/bin/bash
echo "configure FFmpeg"
sudo apt remove -y ffmpeg
sudo apt update
sudo apt -y install   \
    autoconf          \
    automake          \
    build-essential   \
    cmake             \
    git-core          \
    libass-dev        \
    libfreetype6-dev  \
    libsdl2-dev       \
    libtool           \
    libva-dev         \
    libvdpau-dev      \
    libvorbis-dev     \
    libxcb1-dev       \
    libxcb-shm0-dev   \
    libxcb-xfixes0-dev\
    pkg-config        \
    texinfo           \
    wget              \
    zlib1g-dev
sudo apt -y install   \
    libx264-dev       \
    libmp3lame-dev    \
    libopus-dev       \
    yasm
_version="4.1.1"
wget http://ffmpeg.org/releases/ffmpeg-"${_version}".tar.bz2
tar -xvf ffmpeg-"${_version}".tar.bz2
cd ffmpeg-"${_version}"
./configure            \
    --enable-gpl       \
    --enable-libmp3lame\
    --enable-libopus   \
    --enable-libvorbis \
    --enable-libx264
make -j"$(echo "$(nproc)-1" | bc)"
sudo make install
cd ..
rm ffmpeg-"${_version}".tar.bz2
rm -rf ffmpeg-"${_version}"
