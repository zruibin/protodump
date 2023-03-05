#!/bin/bash

BUILD_SYSTEM="macosx"
CURRENT_OS="OSX"
function findCurrentOSType() {
    echo "Finding the current os type"
    osType=$(uname)
    case "$osType" in
           "Darwin")
            {
                echo "Running on Mac OSX."
                CURRENT_OS="OSX"
                BUILD_SYSTEM="macosx"
            } ;;    
           "Linux")
            {
                # If available, use LSB to identify distribution
                if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
                    DISTRO=$(gawk -F= '/^NAME/{print $2}' /etc/os-release)
                else
                    DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v"lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
                fi
                CURRENT_OS=$(echo $DISTRO | tr 'a-z' 'A-Z')
                BUILD_SYSTEM="linux"
            } ;;
            *)
            {
                echo"Unsupported OS, exiting"
                exit
            } ;;
    esac
}
findCurrentOSType

echo "BUILD_SYSTEM: $BUILD_SYSTEM"

cd lua-src
make $BUILD_SYSTEM
mv lua ../
mv luac ../
make clean
cd ../
