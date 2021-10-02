#!/bin/sh

mkdir $HOME/test #1


echo "----------------ДИРЕКТОРИИ----------------" > $HOME/test/list #2
ls -A -l /etc | grep "^d" >> $HOME/test/list
echo "------------------ФАЙЛЫ-------------------" >> $HOME/test/list
ls -A -l /etc | grep "^-" >> $HOME/test/list


echo "Количество директорий: " >> $HOME/test/list #3
ls -A -l /etc | grep "^d" | wc -l >> $HOME/test/list
echo "Количество скрытых файлов: " >> $HOME/test/list
a=$(ls -A -l /etc | grep "^-" | wc -l)
b=$(ls -l /etc | grep "^-" | wc -l)
let c=$a-$b
echo $c >> $HOME/test/list


mkdir $HOME/test/links #4


ln $HOME/test/list $HOME/test/links/list_hlink #5

ln -s $HOME/test/list $HOME/test/links/list_slink #6


a=$(stat --format=%h $HOME/test/links/list_hlink) #7
echo $a

b=$(stat --format=%h $HOME/test/list)
echo $b

c=$(stat --format=%h $HOME/test/links/list_slink)
echo $c


wc -l $HOME/test/list | cut -d " " -f1 >> $HOME/test/links/list_hlink #8


if cmp $HOME/test/links/list_hlink $HOME/test/links/list_slink #9
then
    echo "YES"
else
    echo "NO"
fi


mv $HOME/test/list $HOME/test/list1 #10


if cmp $HOME/test/links/list_hlink $HOME/test/links/list_slink #11
then
    echo "YES"
else
    echo "NO"
fi


ln $HOME/test/list1 list_link #12


find /etc/ -name "*.conf" > $HOME/list_conf #13


find /etc/ -maxdepth 1 -name "*.d" -type d > $HOME/list_d #14


cat $HOME/list_conf > $HOME/list_conf_d #15
cat $HOME/list_d >> $HOME/list_conf_d


mkdir $HOME/test/.sub #16


cp $HOME/list_conf_d $HOME/test/.sub/ #17


cp -b $HOME/list_conf_d $HOME/test/.sub/ #18


ls -R -a $HOME/test #19


man man > $HOME/man.txt #20


split -b 1024 -d $HOME/man.txt $HOME/man_ #21


mkdir $HOME/man.dir #22


mv $HOME/man_* man.dir #23


cat $HOME/man.dir/man_* > $HOME/man.dir/man.txt #24
rm -f $HOME/man.dir/man_*


if cmp $HOME/man.txt $HOME/man.dir/man.txt #25
then
        echo "YES"
else
        echo "NO"
fi


echo "jkse24l;" > $HOME/tmp #26
echo "r48uhr4jek" >> $HOME/tmp
echo "k39ik" >> $HOME/tmp
cat $HOME/man.txt >> $HOME/tmp
cat $HOME/temp > $HOME/man.txt
echo "k39ik" >> $HOME/man.txt
rm -f $HOME/tmp


diff $HOME/man.txt $HOME/man.dir/man.txt > $HOME/man_diff.txt #27


mv $HOME/man_diff.txt $HOME/man.dir/ #28


yum install patch #29
patch $HOME/man.dir/man.txt $HOME/man.dir/man_diff.txt -R


if cmp $HOME/man.txt $HOME/man.dir/man.txt #30
then
        echo "YES"
else
        echo "NO"
fi
