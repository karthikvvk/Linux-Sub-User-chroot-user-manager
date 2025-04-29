#!/bin/bash

sudo umount $CHROOT_DIR/run
sudo umount $CHROOT_DIR/sys
sudo umount $CHROOT_DIR/proc
sudo umount $CHROOT_DIR/dev/pts
sudo umount $CHROOT_DIR/dev
sudo umount $CHROOT_DIR
