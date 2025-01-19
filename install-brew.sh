#!/bin/bash
# https://rapidprogrammer.com/how-to-install-homebrew-with-ansible
yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo >> /home/lprior/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/lprior/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
