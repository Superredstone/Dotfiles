#!/bin/bash

sudo mount /dev/nvme0n1p1 /mnt
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo umount -R /mnt
