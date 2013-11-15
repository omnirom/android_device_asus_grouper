#!/bin/sh -e

if [ -z $1 ]; then
    echo "Syntax: $0 <path/to/system>"
    exit 1
fi 
SYSDIR="$1"

BASE=../../../vendor/asus/grouper/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    echo "Copying $FILE"
    cp "$SYSDIR/$FILE" $BASE/$FILE
done

./setup-makefiles.sh

