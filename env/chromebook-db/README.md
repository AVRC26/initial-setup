# **Chromebook - Debian 10** 

## **Hostname**

- `sudo vi /etc/hostname`
- `sudo vi /etc/hosts`

## **Customize Colors**
- [AVRC26's init-setup](https://github.com/AVRC26/init-setup/blob/InDev/dotfiles/README.md)

## **Install Brave Browser**

- `sudo apt install apt-transport-https curl`

- `curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -`

- `echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ trusty main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-trusty.list`

- `sudo apt update`

- `sudo apt install brave-browser`

## **Visual Studio Code**

- `sudo apt update`

- `sudo apt upgrade`

- `sudo apt install software-properties-common apt-transport-https curl`

- `curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -`

- `sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"`

- `sudo apt update`

- `sudo apt install code -y`


### **VS-Alternate Install**

- `https://code.visualstudio.com/`

- `sudo dpkg -i code_1.40.2-1574694120_amd64.deb`

- `sudo apt-get install -f`

- `sudo dpkg -i code_1.40.2-1574694120_amd64.deb`


### **VS Code Setup***
- [AVRC26's init-setup](https://github.com/AVRC26/init-setup/tree/InDev/VSCode/README.md)


## **Install Docker**
- `sudo apt update`

- `sudo apt upgrade`

- `sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg2`

- `curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -`

- `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"`

- `sudo apt update`

- `sudo apt install docker-ce`

- `sudo systemctl status docker`

- `sudo usermod -aG docker ${USER}`

- `restart machine`

- `docker container run hello-world`

    [LATEST](https://docs.docker.com/engine/install/debian/)

### **Install docker-compose**
- `sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`

- `sudo chmod +x /usr/local/bin/docker-compose`

    [LATEST](https://docs.docker.com/compose/install/)

## **Install Postman**

- `cd /opt/`
- `sudo wget https://dl.pstmn.io/download/latest/linux64?arch=64 -O postman.tar.gz`
- `sudo tar -xzf postman.tar.gz`

- `sudo ln -s  /usr/local/bin/postman`
- `rm -rf postman.tar.gz`
 ```bash
    cat > ~/.local/share/applications/postman.desktop <<EOL
    [Desktop Entry]
    Encoding=UTF-8
    Name=Postman
    Exec=postman
    Icon=/opt/Postman/app/resources/app/assets/icon.png
    Terminal=false
    Type=Application
    Categories=Development;
    EOL
```

<br /><br />
**HELP**

Speed Test
- `curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -`

Expired Key
- `sudo apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com`

Autoremoce
- `sudo apt autoremove`