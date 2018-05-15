#!/bin/bash

# This script is an alternative to accessing all packages through curlftpfs
# since curlftpfs can be much slower than local disk access
# The idea here is to move the remote mountpoint to remotepkgs
# and then rsync from remotepkgs to packages
# Where packages is backed by local disk storage

set -e

FTPREPOHOST="rapidlinux.org"

cd /opt/RL

# If packages is currently a curlftpfs mount point, unmount it
ORIGPKGSMP=`mount | awk '{print $3}' | grep packages`
if [ -n "${ORIGPKGSMP}" ]; then
  if mount | grep "${ORIGPKGSMP}" | awk '{print $1}'| grep -q curlftpfs ; then
    sudo umount packages
  fi
fi

# Create remotepkgs, a new mount point for packages on the remote server
if [ ! -d remotepkgs ]; then
  mkdir remotepkgs
fi

# Mount the server package area on remotepkgs
if ! mount | grep remotepkgs | grep -q curlftpfs ; then
  curlftpfs -r "${FTPREPOHOST}/packages" remotepkgs -o allow_root
fi

# rsync the remote packages to your local storage
rsync -av --delete --progress remotepkgs/* packages/
