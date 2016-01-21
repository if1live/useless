#!/bin/bash

# Fetch image from http://haodiao.org/en_US

if [[ $URL == "" ]]; then
	echo "Usage (example)"
	echo "URL=http://haodiao.org/en_US/6260.html $0"
	echo "URL=http://haodiao.org/en_US/240.html/nggallery/page/3 $0"
	exit
fi

num=$(echo $URL | cut -d/ -f5 | cut -d. -f1)

mkdir $num
cd $num

tmp_file="tmp.html"
curl $URL > $tmp_file
$(grep "http://haodiao.org/wp-content/gallery/" $tmp_file | grep -v "/thumbs/" | cut -d'"' -f2|sort|uniq|awk '{print "wget -N " $1}')
rm $tmp_file

cd ..
