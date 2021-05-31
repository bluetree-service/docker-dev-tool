FROM ubuntu:20.04

LABEL maintainer="chajr@bluetree.pl"

RUN apt-get autoclean; \
    apt-get update --fix-missing; \
    apt-get upgrade -y; \
    #install required software
    DEBIAN_FRONTEND=noninteractive apt-get install -y\
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
    python2\
    glances \
    unzip \
    smem\
    mtr\
    mc\
    sshfs\
    inxi\
    qemu-utils\
    node-file-sync-cmp\
    emacs\
    cryptsetup; \
    ## rename batcat to bat
    mv /usr/bin/batcat /usr/bin/bat; \
    ## ngxtop
    curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py; \
    python2 get-pip.py; \
    pip2 install ngxtop; \
    rm get-pip.py; \
    ## exa
    curl https://sh.rustup.rs -sSf | bash -s -- -y; \
    wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip; \
    unzip exa-linux-x86_64-0.9.0.zip; \
    mv exa-linux-x86_64 /usr/local/bin/exa; \
    rm exa-linux-x86_64-0.9.0.zip; \
    rm -fr root/.rustup/toolchains/stable-x86_64-unknown-linux-gnu; \
    ## bashtop
    git clone https://github.com/aristocratos/bashtop.git; \
    $(cd /bashtop && make install); \
    rm -r /bashtop; \
    ## install osquery
    wget https://pkg.osquery.io/deb/osquery_4.5.1_1.linux.amd64.deb; \
    apt-get install /osquery_4.5.1_1.linux.amd64.deb; \
    rm osquery_4.5.1_1.linux.amd64.deb; \
    ##install innotop
    apt-get install -y mysql-client libterm-readkey-perl libclass-dbi-perl libclass-dbi-mysql-perl; \
    git clone https://github.com/innotop/innotop.git; \
    $(cd innotop && perl Makefile.PL && make install); \
    rm -r /innotop; \
    ## backupninja
    git clone https://github.com/lelutin/backupninja.git; \
    $(cd backupninja && ./autogen.sh && ./configure && make && make install); \
    rm -fr backupninja; \
    ## rclone
    curl https://rclone.org/install.sh | bash; \
    #oh-my-zsh
    yes -n | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
    git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions; \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; \
    ## create link for parent container files access
    apt-get clear cache; \
    rm -fr /tmp/*; \
    ln -s /proc/1/root /parent

## setup bashrc
COPY ./.bashrc /root/

## setup oh-my-zsh
COPY ./.zshrc /root/
COPY ./docker_agnoster.zsh-theme /root/.oh-my-zsh/themes/

## aliases setup
COPY ./aliases.sh /root/
