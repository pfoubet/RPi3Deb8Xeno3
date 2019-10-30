#!/bin/sh

SOURCE=RPi_Deb8_Xeno3.0.5.img.xz
PRE=RPiD8XEN3a

[ -e $SOURCE ] && rm -f $SOURCE
touch $SOURCE
for A in a b c d e f g h ; do
  f=$PRE$A
  [ ! -e $f ] && break
  cat $f >> $SOURCE
done

md5sum $SOURCE > test.md5
cmp test.md5 $SOURCE.md5
if [ $? -ne 0 ] ; then
   echo "ERREUR dans la verification !!"
   echo "Refaire la commande git clone !"
else
   echo "Vous pouvez utiliser $SOURCE !"
   rm -f test.md5
   echo "Pour liberer de la place disque vous pouvez faire :\nrm -f ${PRE}?"
fi

