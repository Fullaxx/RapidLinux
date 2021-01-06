#!/bin/bash

set -e

FTPREPOHOST="pkgs.rapidlinux.org"

# This will be the top-level RapidLinux directory
# It will house the required repositories
RLDIR="/opt/RL"

# It will look like this:
# /opt/RL
# |-- RapidBuilds
# |-- RapidModules
# |-- packages
# `-- output

bail()
{
  echo "$1"
  echo "bailing early!"
  exit 1
}

trymkdirroot()
{
  if [ -e "$1" ]; then
    echo "$1 exists"
  else
    echo "mkdir $1 ..."
    mkdir $1 || bail "You may not have permissions to mkdir $1, use sudo or chown to fix this and retry"
  fi
}

trymkdir()
{
  if [ -e "$1" ]; then
    echo "$1 exists"
  else
    echo "mkdir $1 ..."
    mkdir $1 || bail "Failed to mkdir $1"
  fi
}

tryclone()
{
  if [ -d "$1" ]; then
    echo "$1 exists"
  else
    echo "Cloning $1 ..."
    git clone "https://github.com/Fullaxx/$1.git" || bail "Failed to clone https://github.com/Fullaxx/$1.git"
  fi
}

trymount()
{
  if mount | grep curlftpfs | grep -q "$1" ; then
    echo "$1 appears to be mounted"
  else
    curlftpfs -r "${FTPREPOHOST}/$1" "$1" -o allow_root
  fi
}

checkfuseconf()
{
  if [ ! -f /etc/fuse.conf ]; then
    echo "We need user_allow_other to be enabled in /etc/fuse.conf"
    bail "sudo ./fix_fuse_conf.sh"
  fi
  if ! grep -q "user_allow_other" /etc/fuse.conf ; then
    echo "We need user_allow_other to be enabled in /etc/fuse.conf"
    bail "sudo ./fix_fuse_conf.sh"
  fi
}

trymkdirroot "${RLDIR}"
trymkdir "${RLDIR}/packages"
trymkdir "${RLDIR}/output"

cd ${RLDIR}

tryclone "RapidModules"
tryclone "RapidBuilds"

checkfuseconf
if [ ! -d /opt/RL/packages/acpi ]; then
  trymount packages
fi

if [ ! -f /usr/lib/liblinuxlive ]; then
  cp -v /opt/RL/RapidBuilds/RapidBuild64/001-core/RLBFILES/rootcopy/usr/bin/{xzm2dir,dir2xzm,rl_xm} /usr/bin/
  cp -v /opt/RL/RapidBuilds/RapidBuild64/001-core/RLBFILES/rootcopy/usr/lib/liblinuxlive /usr/lib/
fi

echo
echo "RapidLinux is ready"
echo "cd ${RLDIR}/RapidBuilds and procede to build!"
