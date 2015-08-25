#!/bin/bash
# Linux mint setup

# Check if the user can run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
else

    echo -n "Home or work setup > "
    read setupType
    echo "You entered: $setupType"
    # TODO: Fix '-ne' usage. Need a string comparison operator

    if [ $setupType -ne "work" ] || [ $setupType -ne "home" ]; then
        echo "You must enter either home or work."
    else
        if [ $setupType -eq "work" ]; then
            echo "Work setup installing..."
        elif [ $setupType -eq "home" ]; then
            echo "Home setup installing..."
        fi
        # Generic setup
        echo "Installing general software..."
        add-apt-repository ppa:git-core/ppa
        add-apt-repository ppa:webupd8team/atom
        add-apt-repository ppa:danielrichter2007/grub-customizer
        apt-get update
        apt-get install git
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
fi
