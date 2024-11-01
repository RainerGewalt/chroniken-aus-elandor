#!/bin/bash

# Setze das Projektverzeichnis
PROJECT_DIR="./"

# Update der Paketliste und Installation von benötigten Paketen
echo "Updating package list and installing required packages..."
sudo apt update
sudo apt install -y curl gpg build-essential gawk bison libgdbm-dev libncurses5-dev libsqlite3-dev libyaml-dev sqlite3 libreadline-dev

# Prüfen, ob RVM installiert ist
if ! command -v rvm >/dev/null 2>&1; then
    echo "Installing RVM..."
    gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    \curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
else
    echo "RVM is already installed."
fi

# Set RVM as a login shell
echo "Configuring terminal for RVM login shell support..."
/bin/bash --login

# Prüfen, ob Ruby 3.0 oder höher installiert ist
if ! ruby -v | grep -q "3."; then
    echo "Installing Ruby 3.0..."
    rvm install 3.0.0
    rvm use 3.0.0 --default
else
    echo "Ruby 3.0 or higher is already installed: $(ruby -v)"
fi

# RubyGems und Jekyll Installationspfad im Home-Verzeichnis setzen
echo 'export GEM_HOME="$HOME/.gem"' >> ~/.bashrc
echo 'export PATH="$HOME/.gem/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# RubyGems aktualisieren
echo "Updating RubyGems..."
gem update --system

# Die richtige Version von Bundler installieren
echo "Installing Bundler version 2.5.22..."
gem install bundler:2.5.22

# In das Projektverzeichnis wechseln
echo "Navigating to project directory: $PROJECT_DIR"
cd "$PROJECT_DIR" || { echo "Project directory not found! Exiting."; exit 1; }

# Prüfen, ob Jekyll installiert ist
if ! gem list -i jekyll >/dev/null 2>&1; then
    echo "Installing Jekyll..."
    gem install jekyll
else
    echo "Jekyll is already installed."
fi

# Überprüfen, ob ein Gemfile existiert
if [[ ! -f "Gemfile" ]]; then
    echo "Creating Gemfile..."
    echo 'source "https://rubygems.org"' > Gemfile
    echo 'gem "jekyll"' >> Gemfile
fi

# Installiere die Abhängigkeiten
echo "Installing dependencies with Bundler..."
bundle install

# Starte den Jekyll-Server
echo "Starting Jekyll server..."
bundle exec jekyll serve
