#!/bin/bash

# Fetch image from http://haodiao.org/en_US

if [[ $URL == "" ]]; then
	echo "Usage (example)"
	echo "URL=http://haodiao.org/en_US/6260.html $0"
	echo "URL=http://haodiao.org/en_US/240.html/nggallery/page/3 $0"
	exit
fi

tmp_file="$(date "+%Y%m%d%H%M%S").html"

num=$(echo $URL | cut -d/ -f5 | cut -d. -f1)

last_token=$(echo $URL | rev | cut -d/ -f1 | rev)
echo $last_token | grep ".html"
if [[ $? == 0 ]]; then
	page=0
else
	page=$(($last_token-1))
fi

base_idx=$(($page*30))

mkdir -p $num
cd $num

curl $URL > $tmp_file 2> /dev/null

idx=$((base_idx+1))
for url in $(grep "http://haodiao.org/wp-content/gallery/" $tmp_file | grep -v "/thumbs/" | cut -d'"' -f2|sort|uniq); do
	name=$(printf "%04d" $idx)
	ext=$(echo $url | rev | cut -d. -f1 | rev)
	filename=$name.$ext

	curl $url > $filename 2> /dev/null

	idx=$((idx+1))
done

rm $tmp_file

cd ..
