cat /etc/passwd | awk -F ':' '{print "user " $1 " has id " $3}' > work3.log #1


chage -l root | awk '/Last password change/ {print $NF}' >> work3.log #2


cat /etc/group | awk -F ':' '{print $1}' | tr "\n" "," | head --bytes -1 >> work3.log #3


echo "Be careful!" > /etc/skel/readme.txt   #4


useradd -m -p $(openssl passwd -crypt 12345678) u1      #5


groupadd g2     #6


usermod -a -G g2 u1     #7


id u1 >> work3.log #8


usermod -a -G g2 user #9


cat /etc/group | grep g2 | awk -F ':' '{print $4}' >> work3.log #10


usermod -s /usr/bin/mc u1 #11


useradd -m -p $(openssl passwd -crypt 87654321) u3      #12


mkdir /home/test13 #13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log


chown -R u1:u3 /home/test13 #14
chmod -R o-r /home/test13
сhmod -R ugo-x /home/test13


mkdir /home/test14 #15
chown -R u1:u3 /home/test14
chmod +t /home/test14
chmod -R og+w /home/test14


cp /bin/nano /home/test14/nano #16
chown u1 /home/test14/nano
chmod u+s /home/test14/nano


mkdir /home/test15 #17
chmod ugo-r /home/test15
chmod u-w /home/test15

echo "lev" > /home/test15/secret_file
chmod u-w /home/test15/secret_file
