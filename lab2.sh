sudo fdisk -l #1
sudo fdisk /dev/sda

n
p
3
14551040
+300M
w


sudo blkid -o value -s UUID /dev/sda3 > uuid_sda3.txt #2


sudo mkfs -t ext4 -b 4096 /dev/sda3 #3


sudo tune2fs -l /dev/sda3 > superblock_sda3.txt #4


tune2fs -i 2m -c 2 /dev/sda3 #5


mkdir /mnt/newdisk #6
sudo mount -v /dev/sda3 /mnt/newdisk


ln -s /mnt/newdisk ~/newdisk #7


mkdir /mnt/newdisk/new_dir #8


sudo nano /etc/fstab #9
/dev/sda3 /mnt/newdisk ext4 noatime,noexec 0 0
cd /mnt/newdisk/new_dir
nano script.sh
echo hellow world!
chmod u+x script.sh
./script.sh

reboot
cd /mnt/newdisk/new_dir
./script.sh


cd ~ #10
umount /dev/sda3
sudo fdisk /dev/sda

d
3
n
p
3
14551040
+350M
N
w

e2fsck -f /dev/sda3
resize2fs /dev/sda3

fdisk -l


fsck -nf /dev/sda3  #11


sudo fdisk /dev/sda #12

n 
p 
15267840
+12M
w

mke2fs -b 4096 -O journal_dev /dev/sda4
tune2fs -J device=/dev/sda4 /dev/sda3


umount /dev/sda3 #13
fdisk /dev/sda

d
3
d
4
n
p
3
14551040
+100M
y
n
p
14755840
+100M
w


pvcreate /dev/sda3 /dev/sda4    #14
vgcreate vg1 /dev/sda3 /dev/sda4
lvcreate -L 100M -n lv1 vg1
mkfs.ext4 /dev/vg1/lv1

mkdir /mnt/supernewdisk
mount /dev/vg1/lv1 /mnt/supernewdisk 


mkdir /mnt/share #15
sudo yum install cifs-utils
mount.cifs //ip/linux /mnt/share -o user=*** password=***


sudo nano /etc/fstab #16
//ip/linux /mnt/share cifs user=***,password=***,ro 0 0
