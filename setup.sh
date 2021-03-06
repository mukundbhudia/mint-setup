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

    if [[ $setupType -ne "work" ]] || [[ $setupType -ne "home" ]]; then
        echo "You must enter either home or work."
    else
        # Generic setup
        OSname=$(lsb_release -si);
        echo "Detected $OSname";
        echo "Installing general software..."
        if [[ $OSname -eq "Debian" ]]; then
            apt-get -y install software-properties-common
        fi
        add-apt-repository -y ppa:git-core/ppa
        add-apt-repository -y ppa:webupd8team/atom
        add-apt-repository -y ppa:webupd8team/sublime-text-2
        add-apt-repository -y ppa:danielrichter2007/grub-customizer
        apt-get update
        apt-get -y install firefox
        apt-get -y install git
        apt-get -y install atom
        apt-get -y install sublime-text
        apt-get -y install grub-customizer
        apt-get -y install gufw
        apt-get -y install gitg
        apt-get -y install meld
        apt-get -y install gparted
        apt-get -y install skype
        apt-get -y install vlc
        apt-get -y install opera
        apt-get -y install openvpn
        apt-get -y install wipe
        apt-get -y install playonlinux
        apt-get -y install filezilla
        apt-get -y install xfburn
        apt-get -y install gcolor2

        # Configure git and meld
        git config --global diff.tool meld
        git config --global difftool.prompt false

        git config --global merge.tool meld
        git config --global mergetool.prompt false

        # Download + install avg antivirus
        wget http://download.avgfree.com/filedir/inst/avg2013flx-r3118-a6926.i386.deb
        apt-get -y install avg2013flx-r3118-a6926.i386.deb
        # Disable daemons running on startup
        update-rc.d avgd disable

        # Download + install mysql workbench
        wget http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.3-1ubu1404-amd64.deb
        apt-get -y install mysql-workbench-community-6.3.3-1ubu1404-amd64.deb

        # Install mysql cli
        apt-get -y install mysql-client-core-5.6

        # Install nodejs
        curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
        apt-get -y install --yes nodejs

        # Install google chrome
        sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        apt-get -y update
        apt-get -y install google-chrome-stable

        # Install atom packages
        apm install color-picker
        apm install file-icons
        apm install docblockr
        apm install git-blame
        apm install git-plus
        apm install highlight-line
        apm install highlight-selected
        apm install linter
        apm install linter-jshint
        apm install linter-php
        apm install linter
        apm install linter-csslint
        apm install linter-javac
        apm install minimap
        apm install monokai
        apm install todo-show

        # Configure git adding git alias 'lg' to show a nice git tree
        git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) %an%Creset' --abbrev-commit"

        # Environment specific setup
        if [[ $setupType -eq "work" ]]; then
            echo "Work setup installing..."
        elif [[ $setupType -eq "home" ]]; then
            echo "Home setup installing..."

            apt-get -y install libav-tools
            apt-get -y install compizconfig-settings-manager

            # Install telegram
            # Might be https://tdesktop.com/linux
            wget https://updates.tdesktop.com/tlinux/tsetup.0.8.52.tar.xz
            tar -xf tsetup.0.8.52.tar.xz
            cd Telegram/
            ./Telegram

            # Install Dropbox
            wget "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.02.12_amd64.deb"
            apt-get -y install dropbox_2015.02.12_amd64.deb
        fi
    fi
fi
