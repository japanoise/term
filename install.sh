#!/bin/sh
if [ ! -f st/Makefile ]
then
    git submodule update --init --recursive
fi

if ! which st
then
    (cd st||exit 1; make; sudo make install) || exit 1
fi

if ! which tabbed
then
    (cd tabbed||exit 1; make; sudo make install) || exit 1
fi

mkdir -pv /usr/local/share/applications/

sudo install -m 0644 tabbedst.desktop /usr/local/share/applications/tabbedst.desktop
