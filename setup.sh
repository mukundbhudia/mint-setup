#!/bin/bash
# Linux mint setup
echo -n "Home or work setup > "
read setupType
echo "You entered: $setupType"
if [ "$setupType"!="work" ] || [ "$setupType"!="home" ]; then
    echo "You must enter either home or work."
else
    if [ "$setupType"=="work" ]; then
    echo "Work setup installing..."
    elif [ "$setupType"=="home" ]; then
    echo "Home setup installing..."
    fi
    # Install PPAs
    sudo add-apt-repository ppa:webupd8team/atom
    sudo add-apt-repository ppa:danielrichter2007/grub-customizer
    sudo apt-get update
    sudo apt-get install atom
    sudo apt-get install grub-customizer
    sudo apt-get install gufw
    sudo apt-get install gitg
    sudo apt-get install gparted

    #Download + install mysql workbench
    wget http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.3-1ubu1404-amd64.deb
    sudo apt-get install mysql-workbench-community-6.3.3-1ubu1404-amd64.deb

    #Install mysql cli
    sudo apt-get install mysql-client-core-5.6
fi
