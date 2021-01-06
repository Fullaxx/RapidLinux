# RapidLinux Foreign Build Instructions

## Ubuntu/Docker
Launch an Ubuntu docker container:
```
docker run -it --rm -e TZ='Etc/UTC' -h ubuntu --name rlbuild --device /dev/fuse --cap-add SYS_ADMIN ubuntu:focal
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
