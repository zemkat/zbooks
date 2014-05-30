#/bin/bash
#
# get_ACSESS.sh - gather title list for ACSESS Digital Library
#    compare to last file with vimdiff
#
# Requirements:
#    vim (vimdiff)
#    wget
#    grep
#    sed
#    sort
#
# (c) 2014 Kathryn Lybarger. CC-BY-SA
#

# prep for first time
mkdir -p files
touch files/ACSESS-newest.csv

export date=`date +%F`;
rm -f browse
wget --no-check-certificate "https://dl.sciencesocieties.org/publications/books/browse"

grep "publications/books/tocs" browse | sed -e 's!.*"\(.*\)">\(.*\)</a>.*!\2\t\1!' | sort > files/ACSESS-$date.csv
pushd files
cp ACSESS-newest.csv ACSESS-last.csv
cp ACSESS-$date.csv ACSESS-newest.csv
vimdiff ACSESS-last.csv ACSESS-newest.csv
popd
