#!/bin/bash

# Setze das Projektverzeichnis
PROJECT_DIR="./"

# Update der Paketliste und Installation von Ruby und Bundler
echo "Updating package list and installing Ruby and Bundler..."
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

# Überprüfe, ob Ruby installiert ist
if command -v ruby >/dev/null 2>&1; then
    echo "Ruby successfully installed: $(ruby -v)"
else
    echo "Error installing Ruby. Exiting."
    exit 1
fi

# RubyGems aktualisieren
echo "Updating RubyGems..."
sudo gem update --system

# Überprüfe, ob Bundler installiert ist
if command -v bundle >/dev/null 2>&1; then
    echo "Bundler successfully installed: $(bundle -v)"
else
    echo "Error installing Bundler. Exiting."
    exit 1
fi

# In das Projektverzeichnis wechseln
echo "Navigating to project directory: $PROJECT_DIR"
cd "$PROJECT_DIR" || { echo "Project directory not found! Exiting."; exit 1; }

# Installiere Jekyll mit sudo, falls nicht bereits installiert
if ! gem list -i jekyll >/dev/null 2>&1; then
    echo "Installing Jekyll..."
    sudo gem install jekyll
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
