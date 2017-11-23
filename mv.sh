#!/bin/bash
#set -x
if [ "$#" -eq  "0" ]
   then
     printf "1st arg - currentname\n2nd arg - newname\n3rd - output dir eg. \"/home/user/test\"\n"
     printf " -v | --verbose  "
     exit 1
 fi
for var in "$@"
do
  case $var in
    -v | --verbose )
    set -x
      ;;
  esac
done

readarray -t array < $1 # lista nazw po misequ
readarray -t array2 < $2 # lista id próbki
out_dir=$3
for i in ${!array[*]}; do
  if [[ -z "${array[$i]}" ]]; then
    printf "Enter po ostatniej nazwie\n"
    exit 2
  fi
  cp ${array[$i]}_*_R1_001.fastq.gz $out_dir/${array2[$i]}_R1.fastq.gz
  cp ${array[$i]}_*_R2_001.fastq.gz $out_dir/${array2[$i]}_R2.fastq.gz
done




#printf '%s\n' "${array1[0]}"
#printf '%s\n' "${array1[1]}"
