#!/bin/bash

if [ $# -lt 2 ]
then
echo "Usage: source target"
exit 0
fi

source=$1
target=$2

clang -fobjc-arc -framework Foundation $source -o $target

if [ -e $target ]
then
$target
else
echo "File $target not exist"
fi
