FROM lennart/tida1vm:0.8

RUN apt-get update -q \
  && apt-get install -yq \
     build-essential \
     cmake \
     clang \
     emacs24 \
     git-core \
     libxcursor-dev \
     libxrandr-dev \
     libxinerama-dev \
     libxi-dev \
     libgl1-mesa-dev \
     libglu1-mesa-dev \
     zlib1g-dev \
     libfontconfig1-dev \
     libmpg123-dev \
     libsndfile1 \
     libsndfile1-dev \
     libpulse-dev \
     libasound2-dev \
     libcurl4-gnutls-dev \
     libgstreamer1.0-dev \
     libgstreamer-plugins-bad1.0-dev \
     libgstreamer-plugins-base1.0-dev \
     gstreamer1.0-libav \
     gstreamer1.0-alsa \
     gstreamer1.0-pulseaudio \
     gstreamer1.0-plugins-bad

RUN git clone --recursive -b cmake https://github.com/cinder/Cinder.git $HOME/Cinder

RUN cd $HOME/Cinder/linux \
    && ./cibuild

RUN cd $HOME/Cinder/samples/BasicApp/linux/ \
    && ./cibuild

WORKDIR $HOME/Cinder/samples/BasicApp/linux/Debug/ogl/

CMD ./BasicApp
