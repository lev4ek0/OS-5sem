#!/bin/sh

fdisk /dev/sda #1

Command (m for help): n
Select (default p): p
Partition number (3,4, default 3): 3
First sector (14551040-16777215, default 14551040): 14551040
Last sector, +sectors or +size{K,M,G,T,P} (14551040-16777215, default 16777215): +300Mib
Command (m for help): w


sudo blkid /dev/sda3 | cut -d "\"" -f2 > UUID_sda3 #2


mkfs.ext4 -b 4096 /dev/sda3 #3


dumpe2fs -h /dev/sda3 #4


tune2fs -i 2m -c 2 /dev/sda3 #5


mkdir /mnt/newdisk #6
mount -t ext4 /dev/sda3 /mnt/newdisk


ln -s /mnt/newdisk $HOME/newdisk_slink #7


mkdir $HOME/newdisk_slink/lev_belous #8


echo /dev/sda3 /mnt/newdisk ext4 rw,auto,noexec,noatime 0 0 >> /etc/fstab #9


