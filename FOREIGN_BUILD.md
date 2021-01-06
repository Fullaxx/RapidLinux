# RapidLinux Foreign Build Instructions

## Ubuntu/Docker
Launch an Ubuntu docker container:
```
docker run -it --rm -h ubuntu --name rlbuild --device /dev/fuse --cap-add SYS_ADMIN ubuntu:focal
```
Inside the ubuntu container:
```
apt-get update
apt-get install -y git curlftpfs squashfs-tools xz-utils cpio genisoimage
git clone https://github.com/Fullaxx/RapidLinux.git
cd RapidLinux
./rapidlinux_prepare.sh
```
