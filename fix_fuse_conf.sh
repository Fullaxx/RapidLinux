#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

echo "user_allow_other" >> /etc/fuse.conf
