#!/bin/zsh

# on Debian/Ubuntu systems, it's just called "rename" and is installed by default
# Arch requires perl-rename to be installed separately
perl-rename 's/ /-/g' $@
perl-rename -n 's/ /-/g' $@ # print rename
