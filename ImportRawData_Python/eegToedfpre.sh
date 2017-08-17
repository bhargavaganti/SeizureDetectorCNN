#!/bin/bash



max=205

aa='/media/titusaj/7B3CED566590EA15/ictal_SZ/EMU_SEIZURES_1-205'
a='/SZ_'
b='/NKT'
c='/EEG2100'
e='SZ_'
f='.edf'


for i in `seq 2 $max`
do
  echo "$i"
  d=$aa$a$i$b$c

  echo $d
  cd $d

  fileName=$e$i$f

  nk2edf *.EEG
  mv *.edf $fileName
  mv $fileName $aa

done
