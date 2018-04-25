#!/bin/bash

FTPREPOHOST="rapidlinux.org"

# This will be the top-level RapidLinux directory
# It will house the required repositories
RLDIR="/opt/RL"

# It will look like this:
# /opt/RL
# |-- RapidBuilds
# |-- RapidKernel
# |-- RapidModules
# |-- RapidShells
# |-- isos
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
    curlftpfs "${FTPREPOHOST}/$1" "$1" -o ro,allow_other
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
trymkdir "${RLDIR}/isos"
trymkdir "${RLDIR}/output"

cd ${RLDIR}

tryclone "RapidModules"
tryclone "RapidBuilds"
tryclone "RapidShells"
tryclone "RapidKernel"

checkfuseconf
trymount packages
trymount isos

echo
echo "RapidLinux is ready"
echo "cd ${RLDIR}/RapidBuilds and procede to build!"
