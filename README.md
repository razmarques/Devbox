# Devbox: a distrobox development container
Container image that bundling software development utilities and IDEs, built upon the latest Fedora distribution. Intended to be used with `distrobox`. This is a great solution to set up a software development environment on an immutable distribution such as Aeon or Silverblue.

## The image includes the following:
- Latest Fedora image
- git
- pipx
- GitHub CLI
- Visual Studio Code
- Pycharm Community Edition

## Pre-requisites
- `distrobox` should be installed in the host system.

## Installation
Use distrobox to set up the container:

`distrobox create --image ghcr.io/razmarques/devbox:latest`

Alternatively you can automate the process by using `distrobox assemble` and supply a manifest file: 

`distrobox assemble create --file manifest.ini`

The repository has a manifest file (`devbox.ini`) that you can use. It is configured as follows:

- Pulls the devbox image from the GitHub registry
- Sets the hostname to 'devbox'
- Creates a separate home folder for the devbox environment
- Allways pulls the image and replaces the existing devbox container
- Installs `poetry` package manager from `pipx`
- Exports VSCode and Pycharm Community Edition to the host system

Anyone can use it as is or fork it and customise at will.
