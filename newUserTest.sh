#!/bin/bash

echo -e "\x1B[01;96m Enter a Username to run your blog as:   \x1B[0m" 
read ghostname

echo -e "\x1B[01;96m Enter a Password for that account   \x1B[0m" 
read ghostpass


sudo useradd $ghostname
sudo passwd $ghostname
