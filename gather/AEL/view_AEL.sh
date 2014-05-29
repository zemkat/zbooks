#/bin/bash
#
# view_AEL.sh - View most recently pulled changes to McGraw-Hill's
#     Access Engineering Library
#
# Requirements:
#    vim (vimdiff)
#
# (c) 2014 Kathryn Lybarger. CC-BY-SA
#

pushd files
vimdiff AEL-last.csv AEL-newest.csv
popd
