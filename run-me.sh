#!/bin/bash
if [ -z "$MY_EMAIL" ]; then
	echo "Please set the MY_EMAIL environment variable (work? home?) and try again."
	exit 1;
fi

echo "Manual step: Click 'Install Font' for Inconsolata."
open ./Inconsolata.otf

echo "Manual step: Import 'Tomorrow Night.terminal' in this directory into OS X Terminal Preferences"

echo "Opening tabs for various downloads..."
open -a "Safari.app" "http://www.google.com/search?q=Sublime+Text"
open -a "Safari.app" "http://www.google.com/search?q=Sublime+Text+Package+Manager"
open -a "Safari.app" "http://www.google.com/search?q=xcode"
open -a "Safari.app" "http://www.google.com/search?q=Evernote"
open -a "Safari.app" "http://www.google.com/search?q=Adium"
open -a "Safari.app" "http://www.google.com/search?q=flux"
open -a "Safari.app" "http://www.google.com/search?q=gimp"
open -a "Safari.app" "http://www.google.com/search?q=0xED"
open -a "Safari.app" "http://www.google.com/search?q=Menu+Meters"

echo "Manual step: Add soda theme and tomorrow night colors to Sublime Text"

echo "Setting up ~/.profile"
if [ -e ~/.profile ]; then
	echo "Warning: appending to an existing ~/.profile.  You may want to check the result."
fi
cat profile >> ~/.profile
source ~/.profile

echo "Adding symlink for subl (Sublime Text)"
mkdir -p ~/bin
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
chmod a+x ~/bin/subl

if [ ! -e ~/.ssh/id_rsa.pub ]; then
	echo "Setting up SSH key..."
	ssh-keygen -t rsa -C "$MY_EMAIL"
	ssh-add id_rsa
	pbcopy < ~/.ssh/id_rsa.pub
	echo "Key copied to clipboard. Opening github settings so you can add it..."
	open -a "Safari.app" "https://github.com/settings/ssh"
	open -a "Safari.app" "https://bitbucket.org/account/user/atiba_jgregory/ssh-keys/"
fi

if [ -z "`which brew`" ]; then
	echo "Installing brew"
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	brew doctor
fi

echo "Installing Python"
brew install python
pip install virtualenv virtualenvwrapper ipython nose pylint

echo "Installing git and other programs"
brew install bash-completion git emacs wget gnuplot inkscape

echo "Setting up git"
git config --global color.ui auto
git config --global user.name "Justin Gregory"
git config --global user.email "$MY_EMAIL"
