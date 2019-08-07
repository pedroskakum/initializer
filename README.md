# Initializer

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](code-of-conduct.md)

[Visit the website](https://pedroskakum.github.io/initializer/)

Repository that automatically installs the programs I use most in my linux distro, with aptitude as a package manager.

The purpose of this repository is to provide an interactive initial installation script on a newly formatted linux machine. It was created after my dissatisfaction with having to make countless settings every time I formatted my computer. Scripting is not yet interactive, but I can put this functionality ahead if I find it useful to others. I accept code contributions.

## Initial Config

- [x] Visual Studio Code (including extensions and settings)
- [x] Google Chrome
- [x] Virtual Box
- [x] Git
- [x] Curl
- [x] Node Version Manager
- [x] Kubectl
- [x] Minikube
- [x] Skaffold
- [ ] Fish
- [ ] Oh My Fish (and agnoster theme)
- [x] Microsoft Fonts
- [ ] Gogh (themes for terminal)
- [x] Docker

## Pos Config (beta)

- [x] Dropbox
- [x] Nodejs (via nvm)
- [x] Agnoster Fish Theme
  
## Installation
`git clone https://github.com/pedroskakum/installizer`

`sudo sh installizer/install.sh` (beta)

`sudo sh installizer/pos-install.sh` (alpha)

## Customization

Change the file `vscode-settings.json` for your visual studio setup if you prefer.

## Next updates

Add a `cli` for customize all the settings of script, now is static.
