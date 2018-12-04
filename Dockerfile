FROM ubuntu:16.04
MAINTAINER Yongjia Niu, ahnniu@gmail.com


# Install essential Yocto Project host packages
# Clean up the apt cache by removing /var/lib/apt/lists toreduces the image size
# Install repo tool with tinghua mirror: https://mirrors.tuna.tsinghua.edu.cn/git/git-repo
# Origin: http://commondatastorage.googleapis.com/git-repo-downloads/repo
# See: https://mirrors.tuna.tsinghua.edu.cn/help/git-repo/
# Create a non-root user that will perform the actual build
# Fix error "Please use a locale setting which supports utf-8."
# See https://wiki.yoctoproject.org/wiki/TipsAndTricks/ResolvingLocaleIssues
RUN apt-get update && apt-get install -y \
        gawk \
        wget \
        git-core \
        diffstat \
        unzip \
        texinfo \
        gcc-multilib \
        build-essential \
        chrpath \
        socat \
        libsdl1.2-dev \
        xterm \
        sed \
        cvs \
        subversion \
        coreutils \
        texi2html \
        docbook-utils \
        python-pysqlite2 \
        help2man \
        make \
        gcc \
        g++ \
        desktop-file-utils \
        libgl1-mesa-dev \
        libglu1-mesa-dev \
        mercurial \
        autoconf \
        automake \
        groff \
        curl \
        lzop \
        asciidoc \
        u-boot-tools \
        cpio \
        sudo \
        locales \
 && rm -rf /var/lib/apt/lists/* \
 && curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo > /usr/bin/repo \
 && chmod a+x /usr/bin/repo \
 && id build 2>/dev/null || useradd --uid 30000 --create-home build \
 && echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers \
 && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && echo 'LANG="en_US.UTF-8"'>/etc/default/locale \
 && dpkg-reconfigure --frontend=noninteractive locales \
 && update-locale LANG=en_US.UTF-8

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

USER build
WORKDIR /home/build
CMD "/bin/bash"




