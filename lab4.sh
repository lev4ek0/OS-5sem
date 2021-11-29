dnf group install "Development Tools" #1


mkdir lab4 #2
cd lab4
yum install wget
wget -O bastet.tgz 'https://docs.google.com/uc?export=download&id=1Likanu92YXCZzk4zmb3tQpVF6VuczQUu'
tar -zxvf bastet.tgz
cd bastet-0.43
make
nano Makefile
  install:
          cp ./bastet /usr/bin
make install
ls -l /usr/bin | grep bastet    

cd ..
dnf list installed > task3.log #3


dnf repoquery --requires gcc > task4_1.log #4
dnf repoquery --whatrequires libgcc > task4_2.log


cd ..
mkdir localrepo #5
wget -O checkinstall.rpm -r 'https://docs.google.com/uc?export=download&id=1e7JcC9qrXz2rLX47njB-6mqslGNLC3Hx'
dnf install createrepo
createrepo -v $HOME/localrepo
echo -e "[localrepo]\nname=localrepo\nbaseurl=file:///root/localrepo/\nenabled=1\ngpgcheck=0" >> /etc/yum.repos.d/localrepo.repo


dnf repolist >> ~/lab4/task6.log #6


/etc/yum.repos.d/ #7
for file in *.repo; do mv -- "${file}" "${file/%repo/nerepo}"; done
for file in localrepo.nerepo; do mv -- "${file}" "${file/%nerepo/repo}"; done
dnf repolist
dnf repository-packages localrepo info
dnf install checkinstall

wget -c https://sourceforge.net/projects/alien-pkg-convert/files/release/alien_8.95.tar.xz #8
tar xf alien_8.95.tar.xz
dnf install perl
perl Makefile.PL
make
make install
wget -O fortunes.deb -r 'https://docs.google.com/uc?export=download&id=1ZYzShYWq_561AEEMeSuUjBi17uhdoKxR'
alien --to-rpm fortunes.deb
rpm -ivh --force fortunes.rpm

wget -c https://www.nano-editor.org/dist/v5/nano-5.9.tar.xz #9
tar xf nano-5.9.tar.xz
cd nano-5.9
./configure --program-prefix=new
make
make install
cd
newnano test.txt
