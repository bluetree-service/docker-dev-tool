FROM ubuntu:20.04

LABEL maintainer="chajr@bluetree.pl"

RUN apt-get autoclean
RUN apt-get update --fix-missing
RUN apt-get upgrade -y

RUN apt-get install -y\
    git\
    make\
    apt-utils\
    htop\
    vim\
    nano\
    iputils-ping\
    fping\
    net-tools\
    lsof\
    nmap\
    netcat\
    lnav\
    multitail\
    sysstat\
    curl\
    bat\
    silversearcher-ag\
    mytop\
    rsync\
    nethogs\
    libfmt-dev\
    wget\
    iproute2\
    arp-scan\
    tig\
    ctop\
    iftop\
    bmon\
    nload\
    speedometer\
    iotop\
    dstat\
    lynx\
    telnet\
    whois\
    jp2a\
    pv\
    bsdmainutils\
    uuid-runtime\
    ftp\
    zsh\
    tree\
    pydf\
    fdupes\
    exiftool\
    swaks\
    iptraf\
    psmisc\
    atop\
    nmon\
    iozone3\
    strace\
    gawk\
    rdiff-backup\
    duplicity\
    hwinfo\
    automake\
    iperf3\
    cloc\
    fzf\
    ranger\
    httpie\
    whowatch\
    tcpdump\
    python2

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y\
    smem\
    mtr\
    mc\
    sshfs\
    inxi\
    qemu-utils\
    node-file-sync-cmp\
    emacs\
    cryptsetup

## rename batcat to bat
RUN mv /usr/bin/batcat /usr/bin/bat

## ngxtop
RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
RUN python2 get-pip.py
RUN pip2 install ngxtop
RUN rm get-pip.py

## exa
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
RUN unzip exa-linux-x86_64-0.9.0.zip
RUN mv exa-linux-x86_64 /usr/local/bin/exa
RUN rm exa-linux-x86_64-0.9.0.zip

## bashtop
RUN git clone https://github.com/aristocratos/bashtop.git
WORKDIR /bashtop
RUN make install
RUN rm -r /bashtop
WORKDIR /

## install osquery
RUN wget https://pkg.osquery.io/deb/osquery_4.5.1_1.linux.amd64.deb
RUN apt-get install /osquery_4.5.1_1.linux.amd64.deb
RUN rm osquery_4.5.1_1.linux.amd64.deb

##install innotop
RUN apt-get install -y mysql-client libterm-readkey-perl libclass-dbi-perl libclass-dbi-mysql-perl
RUN git clone https://github.com/innotop/innotop.git
WORKDIR /innotop
RUN perl Makefile.PL 
RUN make install
RUN rm -r /innotop
WORKDIR /

## backupninja
RUN git clone https://github.com/lelutin/backupninja.git
WORKDIR /backupninja
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
WORKDIR /
RUN rm -fr backupninja

## rclone
RUN curl https://rclone.org/install.sh | bash

## setup bashrc
COPY ./.bashrc /root/

## setup oh-my-zsh
RUN yes -n | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
COPY ./.zshrc /root/
COPY ./docker_agnoster.zsh-theme /root/.oh-my-zsh/themes/

## aliases setup
COPY ./aliases.sh /root/

## create link for parent container files access
RUN ln -s /proc/1/root /parent
