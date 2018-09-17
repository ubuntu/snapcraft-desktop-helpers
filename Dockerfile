FROM snapcore/snapcraft:stable

RUN apt-get install -q -y --no-install-recommends software-properties-common && \
  add-apt-repository -yu ppa:ubuntu-desktop/gnome-3-26 && \
  apt-get update && \
  apt-get dist-upgrade --yes && \
  apt-get install --yes \
  build-essential \
  libgtk-3-dev \
  snapcraft \
  && \
  apt-get autoclean --yes && \
  apt-get clean --yes

# Required by click.
ENV LC_ALL C.UTF-8
ENV SNAPCRAFT_SETUP_CORE 1
