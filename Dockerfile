FROM debian:buster

# System-Pakete installieren
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    subversion \
    libncurses5-dev \
    zlib1g-dev \
    gawk \
    flex \
    bison \
    wget \
    unzip \
    python2 \
    autoconf \
    automake \
    gettext \
    libtool \
    pkg-config \
    bc \
    imagemagick \
    libacl1-dev \
    libcap-dev \
    libreadline-dev \
    gcc-multilib \ 
    g++-multilib \ 
    libc6-dev-i386 \
    && ln -s /usr/bin/libtoolize /usr/bin/libtool \
    && echo "root:toor" | chpasswd \
    && ln -s /usr/bin/python2 /usr/bin/python \
    && apt-get clean

# Benutzer erstellen
RUN useradd -m -s /bin/bash freetzuser
RUN mkdir -p /home/freetzuser/freetz && chown -R freetzuser:freetzuser /home/freetzuser/freetz

# Arbeitsverzeichnis setzen
USER freetzuser
WORKDIR /home/freetzuser

# Freetz herunterladen
RUN git clone https://github.com/Freetz/freetz.git && cd freetz 
# && git checkout stable-1.2

CMD ["/bin/bash"]
