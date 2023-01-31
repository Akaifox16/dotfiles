#! /bin/bash

my_path=$(echo $PATH | tr ':' "\n")
  
for i in "$my_path[@]"
do
  echo $i
done
