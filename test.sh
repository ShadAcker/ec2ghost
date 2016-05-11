#!/bin/bash
#echo -e "\x1B[01;96m  foo   \x1B[0m"

echo -e "\x1B[01;96m Enter your IP or Site's URL (e.g. www.myblog.com):   \x1B[0m" 
read site
sed  -i -e 's/XXX/$site/g' ghost.conf
sed  -i -e 's/XXX/$site/g' config.js

