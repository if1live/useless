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

idx=1
for url in $(grep "http://haodiao.org/wp-content/gallery/" $tmp_file | grep -v "/thumbs/" | cut -d'"' -f2|sort|uniq); do
	name=$(printf "%04d" $idx)
	ext=$(echo $url | rev | cut -d. -f1 | rev)
	filename=$name.$ext

	curl $url > $filename

	idx=$((idx+1))
done

rm $tmp_file

cd ..
