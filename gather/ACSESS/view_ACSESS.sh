#/bin/bash
#
# view_AEL.sh - View most recently pulled changes to ACSESS Digital Library
#
# Requirements:
#    vim (vimdiff)
#
# (c) 2014 Kathryn Lybarger. CC-BY-SA
#

pushd files
vimdiff ACSESS-last.csv ACSESS-newest.csv
popd
