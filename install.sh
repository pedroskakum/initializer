# Visual estudio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https --yes
sudo apt update --yes
sudo apt install code --yes # or code-insiders

# Install Extensions
code --install-extension googlecloudtools.cloudcode
code --install-extension ms-azuretools.vscode-docker
code --install-extension fatihacet.gitlab-workflow
code --install-extension orta.vscode-jest
code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension octref.vetur
code --install-extension vscode-icons-team.vscode-icons

# Visual Studio Config
sudo cp --force vscode-settings.json > ~/.config/Code/User/

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update --yes
sudo apt install google-chrome-stable --yes

# Virtual Box
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian disco non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list' 
sudo apt update --yes
sudo apt install virtualbox-6.0 --yes

# Git
sudo apt install git --yes
git config --global user.email "pedroskakum@gmail.com"
git config --global user.name "Pedro Paulo Skakum"
sudo apt install git-flow --yes

# Curl
sudo apt install curl --yes

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Kubectl
sudo apt update --yes
sudo apt install --yes apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update --yes
sudo apt install --yes kubectl

# Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin
sudo rm minikube

# Skaffold
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x skaffold
sudo mv skaffold /usr/local/bin

# Fish
sudo apt-add-repository ppa:fish-shell/release-3 --yes
sudo apt update --yes
sudo apt install fish --yes
chsh -s `which fish` # fish as default shell

# Oh My Fish
curl -L https://get.oh-my.fish | fish

# Fonts
# sudo apt install ttf-mscorefonts-installer --yes
# sudo apt-get install fonts-powerline --yes
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Install Agnoster theme
omf install agnoster
bash

# Gogh Themes for Terminal (Terminal Compatible only)
echo "ALL" | bash -c  "$(wget -qO- https://git.io/vQgMr)" 

# Docker
sudo apt install ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce --yes
sudo usermod -aG docker ${USER} # (for run docker without sudo)

# Docker Machine
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine
# Slack

# Google Play
wget https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v4.6.1/google-play-music-desktop-player_4.6.1_amd64.deb -O gpmdp.deb
sudo dpkg -i gpmdp.deb
sudo apt-get install -f -y
sudo apt-get remove google-play-music-desktop-player

# Scudcloud
sudo apt-add-repository -y ppa:rael-gc/scudcloud
sudo apt update && sudo apt dist-upgrade
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install scudcloud

# Ao (Microsoft Todo List)
wget https://github.com/klaussinani/ao/releases/download/v6.8.0/ao-6.8.0-x86_64.AppImage -O ao.appimage
chmod a+x ao.appimage
sudo ./ao.appimage
# or
# sudo apt install snapd
# sudo snap install ao --beta

# Gitlab Runner
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
sudo chmod +x /usr/local/bin/gitlab-runner
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start

# Helm
sudo snap install helm --classic

