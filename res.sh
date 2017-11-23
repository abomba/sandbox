#!/bin/bash
# string1="qwerty"
# string2="qwertzaaa"
# # diff  <(echo "$string1" ) <(echo "$string2")
# #
# #
# # mkfifo ./p
# # diff - p <<< "$string1" & echo "$string2" > p
#
#
# awk '{gsub(".","&\n");printf "%s",$0}' <(echo "$string1") >f1a
# awk '{gsub(".","&\n");printf "%s",$0}' <(echo "$string2") >f2a
# diff -y f1a f2a  #will output both lines and show differences
#
rm file.txt
rm seq_a.txt
rm seq_b.txt
seq_a="ATCTATCATAACT"
seq_b="ATCTATCCTACGAGCG"
len_a=${#seq_a}
len_b=${#seq_b}
miss=""

if [[ $len_a > $len_b ]]; then
  i=$len_b
else
  i=$len_a
fi

for (( pos = 0; pos <= i; pos++)); do
  if [[ ${seq_a:$pos:1} != ${seq_b:$pos:1} ]]; then
    echo -n " " >> file.txt
    echo -n -e '\e[41m'"${seq_a:$pos:1}" >> seq_a.txt
    echo -n -e '\e[41m'"${seq_b:$pos:1}" >> seq_b.txt
  else
    echo -n "|" >> file.txt
    echo -n -e '\e[42m'"${seq_a:$pos:1}" >> seq_a.txt
    echo -n -e '\e[42m'"${seq_b:$pos:1}" >> seq_b.txt
  fi

done
echo -n -e '\e[0m'"${seq_a:$pos:1}" >> seq_a.txt
echo -n -e '\e[0m'"${seq_b:$pos:1}" >> seq_b.txt
 # echo $seq_a
 # cat file.txt
 # echo $seq_b

awk 1 seq_a.txt file.txt seq_b.txt > all.txt
cat all.txt
