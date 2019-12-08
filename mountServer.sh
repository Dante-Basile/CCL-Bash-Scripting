#!/usr/bin/env bash
mntPath=""
serverUname=""
serverAdress=""
sudo umount -f "$mntPath"
sudo rmdir "$mntPath"
mkdir "$mntPath"
sshfs "$serverUname@$serverAdress:/" "$mntPath"
