#!/bin/bash
# Linux mint setup
echo -n "Home or work setup > "
read setupType
echo "You entered: $setupType"
if [ $setupType -ne "work" ] || [ $setupType -ne "home" ]; then
    echo "You must enter either home or work."
else
    if [ "$setupType"=="work" ]; then
    echo "Work setup installing..."
    elif [ "$setupType"=="home" ]; then
    echo "Home setup installing..."
    fi
    # Install PPAs
    add-apt-repository ppa:webupd8team/atom
    add-apt-repository ppa:danielrichter2007/grub-customizer
    apt-get update
    apt-get install atom
    apt-get install grub-customizer
    apt-get install gufw
    apt-get install gitg
    apt-get install gparted

    #Download + install mysql workbench
    wget http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.3-1ubu1404-amd64.deb
    apt-get install mysql-workbench-community-6.3.3-1ubu1404-amd64.deb

    #Install mysql cli
    apt-get install mysql-client-core-5.6
fi
