#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Type your name (for git): "
read name
echo "Type your email (for git): "
read email
echo -n "If you have visual studio settings, replace in the vscode-settings.json file before we continue. Do you want to continue now? (y/n) "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then

# Visual estudio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install --assume-yes --quiet apt-transport-https
apt-get update
apt-get install --assume-yes --quiet code # or code-insiders

# Visual Studio Config
cp --force vscode-settings.json > ~/.config/Code/User/

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt-get update
apt-get install --assume-yes --quiet google-chrome-stable

# Virtual Box
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | apt-key add -
sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian disco non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list' 
apt-get update
apt-get install --assume-yes --quiet virtualbox-6.0

# Git
apt-get install --assume-yes --quiet git
git config --global user.email $email
git config --global user.name $name
apt-get install --assume-yes --quiet git-flow

# Curl
apt-get install --assume-yes --quiet curl

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Kubectl
apt-get update
apt-get install --assume-yes --quiet apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install --assume-yes --quiet kubectl

# Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
install minikube /usr/local/bin
rm minikube

# Skaffold
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x skaffold
mv skaffold /usr/local/bin

# Docker
apt-get install --assume-yes --quiet ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-get update
apt-get install --assume-yes --quiet docker-ce
usermod -aG docker ${USER} # (for run docker without sudo)

# Docker Machine
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
install /tmp/docker-machine /usr/local/bin/docker-machine

# Slack
wget "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.1-amd64.deb"
dpkg -i gpmdp.deb

# Google Play
wget https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v4.6.1/google-play-music-desktop-player_4.6.1_amd64.deb -O gpmdp.deb
dpkg -i gpmdp.deb
apt-get install --assume-yes --quiet
apt-get remove google-play-music-desktop-player

# Fonts
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
apt-get install --assume-yes --quiet fonts-powerline
cd ..
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Scudcloud
# apt-add-repository ppa:rael-gc/scudcloud
# apt-get update
# apt-get install --assume-yes --quiet scudcloud

# Ao (Microsoft Todo List)
wget https://github.com/klaussinani/ao/releases/download/v6.8.0/ao-6.8.0-x86_64.AppImage -O ao.appimage
chmod a+x ao.appimage
# ./ao.appimage
# or
# apt-get install --assume-yes --quiet snapd
# snap install ao --beta

# Gitlab Runner
curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
chmod +x /usr/local/bin/gitlab-runner
useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
gitlab-runner start

# Helm
snap install helm --classic

# Fish
# apt-add-repository ppa:fish-shell/release-3
# apt-get update
# apt-get install --assume-yes --quiet fish
# chsh -s `which fish` # fish as default shell

# Oh My Fish
# curl -L https://get.oh-my.fish | fish

# Gogh Themes for Terminal (Terminal Compatible only)
# echo "ALL" | bash -c  "$(wget -qO- https://git.io/vQgMr)" 


# Install VSCode Extensions
# -i -u $USER bash << EOF
# code --install-extension googlecloudtools.cloudcode
# code --install-extension ms-azuretools.vscode-docker
# code --install-extension fatihacet.gitlab-workflow
# code --install-extension orta.vscode-jest
# code --install-extension esbenp.prettier-vscode
# code --install-extension ms-vscode.vscode-typescript-tslint-plugin
# code --install-extension octref.vetur
# code --install-extension vscode-icons-team.vscode-icons
# EOF

else
  echo "bye!"
fi
