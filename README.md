# Docker dev tools
Docker image contain lot of tools usable for debugging other containers.

Forget about `apt-get`, `zypper`, `yum` etc. Forget about installing any software on existing containers!  
Now you can execute you favorite software on containers without installation. Just run this image with connection to
preferred container and run some of preinstalled software directly, or just run shell and do everything you want.  
Image based on Ubuntu 20.04 and its have all programs that are included in that version with some other listed bellow.

This container prepared only for developing and debugging containers. So it shouldn't be installed on production
environment.

## Usage

`docker run --net container:{container name} --pid container:{container name} -it --rm bluetree/docker-dev-tool {command}`

Example:  
`docker run --net container:test --pid container:test -it --rm bluetree/docker-dev-tool bashtop`

Usage tools on host OS:  
`docker run --net host --pid host -it --rm bluetree/docker-dev-tool bashtop`

### Access to container file system
If container that we are connecting is run as `root` user (ID=0) you can get access to it filesystem by `/parent/` directory
which is alias to `/proc/1/root`.  
If container is running as different user, you should run _docker-dev-tool_ with the same user:group ID's using `-u` flag  
(`-u {user id}:{group id}`).  
`docker run --net container:test --pid container:test -u 33:33 -it --rm bluetree/docker-dev-tool bash`

## List of additional included programs

### Terminal

* **zsh** - interactive shell and as a scripting language interpreter
* **pv** - monitor the progress of data through a pipe

### Files & directories

* **mc** - file manager
* **tree** - display file structure as tree
* **exa** - a modern replacement for ‘ls’
* **cmp** - compare two files byte by byte
* **bat** - a cat(1) clone with syntax highlighting and Git integration
* **ag** - very fast grep-like program, alternative to ack-grep
* **hexdump** - dump file contents into many formats like hexadecimal, octal, ASCII and decimal
* **fmt** - formatter for simplifying and optimizing text files
* **fdupes** - find duplicated files
* **exiftool** - read file metadata
* **duplicity** - backs directories by producing encrypted tar-format volumes and uploading them to a remote or local file server
* **rdiff-backup** -local/remote incremental backup
* **backupninja** - coordinate system backup by dropping a few simple configuration file
* **fzf** - A Quick Fuzzy File Search from Linux Terminal
* **ranger** - simple file manager

### Editors

* **vim** - text editor
* **nano** - text editor, easier than vim
* **emacs** - very powerful text editor

### System

* **inxi** - system information
* **htop** - display current system overloading
* **bashtop** - more advanced version of htop
* **ctop** - top for monitoring containers
* **iotop** - monitor hard disk load in real time
* **dstat** - monitor hard disk load
* **hdparm** - get/set hard disk parameters
* **iostat** - hard disk load
* **smem** - report memory usage with shared memory divided proportionally
* **lsof** - display opened files & programs that using them
* **pidstat** - monitor and find statistics for linux processes
* **osquery** - an operating system instrumentation framework
* **pydf** - python version of df
* **qemu-io** - QEMU disk exerciser
* **pstree** - shows running processes as a tree
* **atop** - interactive monitor to view the system load
* **nmon** - performance system monitor tool
* **iozone** - filesystem benchmark
* **strace** - debugging and troubleshooting programs in Linux
* **hwinfo** - check details about hardware components
* **whowatch** - Monitor Users and Processes in Real Time
* **glances** - system monitoring tool

### Network

* **ping** - test network connection
* **fping** - extended version of ping
* **netstat** - display list ov available TCP & UDP connections
* **nmap** - network exploration tool and security / port scanner
* **nc** - arbitrary TCP and UDP connections and listens
* **curl** - transfer data from or to a server, using one of the supported protocols
* **nethogs** - monitoring network traffic
* **mtr** - (my traceroute) command line network diagnostic tool
* **wget** - download files
* **ip** - network interface configuration & information
* **arp-scan** - scan the network of a certain interface for alive hosts
* **iftop** - network bandwidth monitoring tool that shows updated list of network usage bandwidth
* **bmon** - network bandwidth monitoring and debugging tool
* **nload** - monitor network bandwidth usage in real time
* **speedometer** - shows a graph of your current and past network speed
* **lynx** - cli web browser
* **tcpdump** - capture and analyze network traffic
* **telnet** - network protocol for connect to remote systems
* **whois** - domain detailed information
* **ftp** - file transfer protocol
* **sshfs** - mount directories by ssh
* **rsync** - synchronize files & directories
* **qemu-nbd** - QEMU disk network block device server
* **swaks** - allow sending simple email
* **iptraf** - network monitor
* **iperf3** - performing real-time network throughput measurements
* **iptraf-ng** - IP LAN monitoring tool
* **http** - modern, user-friendly, and cross-platform command line HTTP client
* **tcpdump** - capture and analyze network traffic
* **nmcli** - manage network connections

### Databases

* **mytop** - MySQL - performance monitor
* **innotop** - MySQL and InnoDB transaction/status monitor
* **mysql** - mysql client
* **mysqldump** - dump mysql database

### Other tools

* **tig** - git cli interface
* **jp2a** - display images in cli as ascii
* **multitail** - tail on multiple hosts in same time
* **lnav** - log navigator, watch logs in real time and format output
* **qemu-img**-  QEMU disk image utility, allow to convert images
* **gawk** - pattern scanning and processing language
* **cloc** - count lines of code in all languages
* **rclone** - Sync Files Directories from Different Cloud Storage
* **unzip** - Unpack zip archives
