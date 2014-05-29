#/bin/bash
#
# get_AEL.sh - gather title list for McGraw-Hill Access Engineering Library
#    compare to last file with vimdiff
#
# Requirements:
#    vim (vimdiff)
#    curl
#    grep
#    sed
#
# (c) 2014 Kathryn Lybarger. CC-BY-SA
#

# prep for first time
mkdir -p files
touch files/AEL-newest.csv

export date=`date +%F`;
curl http://accessengineeringlibrary.com/browse?from=all | grep "book-title" | sed -e 's/.*href="\([^"]*\)">\([^<]*\)<.*$/\2\t\1/' > files/AEL-$date.csv
pushd files
cp AEL-newest.csv AEL-last.csv
cp AEL-$date.csv AEL-newest.csv
vimdiff AEL-last.csv AEL-newest.csv
popd
