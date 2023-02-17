#! /bin/bash

my_path=$(echo $PATH | tr ':' "\n")
  
for dir in $my_path ; do echo $dir; done | bat 
