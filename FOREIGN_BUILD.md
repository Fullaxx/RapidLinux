# RapidLinux Foreign Build Instructions

## Ubuntu/Docker
In some cases curlftpfs will not function properly w/o being in a privileged container. \
Any insight into why the first run command is occasionally insufficient would be appreciated. \
Launch an Ubuntu docker container using one of the following methods:
```
docker run -it --rm -e TZ='Etc/UTC' --device /dev/fuse --cap-add SYS_ADMIN ubuntu:focal
<or>
docker run -it --rm -e TZ='Etc/UTC' --privileged ubuntu:focal
```

Inside the ubuntu container:
```
export DEBIAN_FRONTEND="noninteractive"
apt-get update
apt-get install -y git curlftpfs squashfs-tools xz-utils cpio genisoimage
git clone https://github.com/Fullaxx/RapidLinux.git
cd RapidLinux
./fix_fuse_conf.sh
./rapidlinux_prepare.sh
```
