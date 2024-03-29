<p align="center">
<img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white"><img src="https://badges.frapsoft.com/os/v2/open-source-175x29.png?v=103"><br><a href="https://www.kernel.org/category/about.html"><img src="https://badges.frapsoft.com/bash/v1/bash-200x34.png?v=103"><a href=""></a>

<br>
	
<h1 align="center"><b><i>Simple, important & cool resources for</b></i></h1>
<h3 align="center">(Ubuntu)</h3>
<p align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Linux_Mint_Logo_%28until_2021%29.svg/1200px-Linux_Mint_Logo_%28until_2021%29.svg.png?20210414163034" width=50%></p>

To Do 
- [ ] Replace Ananicy with <a href="https://github.com/AdnanHodzic/auto-cpufreq"><b>auto-cpufreq</b></a>
	  
- [ ] Add <a href="https://waydro.id/index.html"><b>Waydroid</b></a>
	
- [ ] Add <a href="https://github.com/wwmm/easyeffects"><b>EasyEffects</b></a> for PipeWire's audio server only

- [ ] Add <a href="https://www.qemu.org/"><b>QEMU</b></a>

- [ ] Add <a href="https://gitlab.com/volian/nala#nala"><b>Nala</b></a> package manager


	
# Contents
- [Kernels & Drivers 🔧](#custom-kernels--drivers)
  - [XanMod](#xanmod)
  - [Liquorix](#liquorix)
- [Better Audio 🔊](#boost-audio-)
  - [Equalizer](#equalizer)
  - [Audio Tweaks](#audio-tweaks)
  - [Troubleshoot](#troubleshoot)
- [Longer Battery Life 🔋](#better-battery)
  - [Install TLP package](#install-tlp-package)
  - [Disable Bluetooth](#disable-bluetooth)
  - [Turn Off Firewall Logs](#turn-off-firewall-logs)
  - [Disable Gome features](#disable-gome-features)
- [Optimize RAM&SSD 🚀](#optimize-ramssd)
  - [Decrease swap](#decrease-swap)
  - [Set VFS cache pressure](#set-vfs-cache-pressure)
  - [Disable write access](#disables-write-access)
  - [Prevent out of memory](#prevent-out-of-memory)
- [Better CPU Managment 💻](#better-cpu)
- [Touchpad Gestures 🖱️](#install-touchegg)
- [Customization 🎨](#customization)
- [Software 📥](#softwares)
- [Retro Gaming 🎮](#retro-gaming)
  - [Install RetroPi](#install-retropi)
  - [Install Themes](#install-themes)
  - [Install Shaders](#install-shaders)
  - [The Bezel Project](#the-bezel-project)
- [Terminal 🔳](#terminal)
  - [Cool Bash ](#cool-bash)
  - [Pimp out Neofetch](#pimp-out-neofetch--can-be-added-to-bashrc)
  - [Oh-My-fish](#use-oh-my-fish)
  - [GitHub search](#gh-s---search-github-repositories-interactively-from-the-command-line)
- [Linux Resources 📚](#linux-resourses)
	
***

<h2 align="center">🔧<b><i>CUSTOM KERNELS & DRIVERS</b></i>🔧</h2>

> [!NOTE]
<i>Depending on the type of hardware you have, one **might** work better than the other. But in my opinion XanMod good for gaming and Liquorix for heavy tasks like video editing, vscode etc.</i>

#### <a href="https://xanmod.org/"><b>XanMod</b></a>

    echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
    wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/xanmod-kernel.gpg add -
    sudo apt update && sudo apt install linux-xanmod
      
or

#### <a href="https://liquorix.net/"><b>Liquorix</b></a>

    sudo add-apt-repository ppa:damentz/liquorix && sudo apt-get update
    sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64
    sudo reboot
	
***
**[⬆ BACK TO TOP ⬆](#contents)**
	
<h2 align="center"><b><i>🔊BOOST AUDIO🔊</b></i> </h2>

###  Equalizer 

<a href="https://flathub.org/apps/details/com.github.wwmm.pulseeffects"><b>Pulse Effects</b></a> (will make soft speakers alot louder)
	
<img src="https://user-images.githubusercontent.com/18756975/168470285-7d16cddc-38ca-4ac3-8829-69cc6bf17297.png" width=350px height=200px><br>
```
sudo apt-get install pulseeffects lsp-plugins
````

Presets
> <a href="https://github.com/JackHack96/EasyEffects-Presets/tree/pulseeffects"><b>pulse-presets</b></a>


###  Audio Tweaks 
Check out this <a href="https://github.com/trinib/Awesome-Linux-Mint-Basics/blob/main/Enable%20High%20Quality%20Audio.md"><b>guide</b></a>

###  Troubleshoot 
If there is any issue with your audio like *_lag_* or in my case *_louder volume_* feature was not working, From linux-mint forums :
```
killall pulseaudio
sudo killall pulseaudio
sudo apt-get purge pulseaudio pulseaudio-utils gstreamer0.10-pulseaudio libpulse-browse0 paman pavumeter pavucontrol
sudo mv /etc/asound.conf /etc/asound.conf-bak
rm ~/.pulse-cookie
rm -r ~/.pulse
sudo apt-get install libalsaplayer0
```
	
***
**[⬆ BACK TO TOP ⬆](#contents)**

<h2 align="center">🔋<b><i>BETTER BATTERY</b></i>🔋</h2>

###  Install <a href="https://linrunner.de/tlp/"><b>TLP</b></a> package 
1. Open synaptic package manager
2. Search for tlp package
3. Right click package, select mark for installation and mark
4. Click apply
	
###  Disable Bluetooth 
```	
sudo systemctl disable bluetooth.service    
## To re-enable
sudo systemctl enable bluetooth.service
```
###  Turn Off Firewall Logs 
```
sudo ufw logging off 
## To re-enable
sudo ufw logging low
```	
###  Disable Gome features 

Disabling Vsync&Windows Compositing (found in `general`)
	
Disable Startup Apps
	
Disable All Effects & Animations
	
Disable Automatic Screen Rotation (found in `display settings`)

***
**[⬆ BACK TO TOP ⬆](#contents)**

<h2 align="center">🚀<b><i>OPTIMIZE RAM&SSD</b></i>🚀</h2>

###  Decrease <a href="https://www.linux.com/news/all-about-linux-swap-space/"><b>swap</b></a> 

_Only if using 8gb ram or more for less disk writes and more use of memory_
	
Open:
```
sudo nano /etc/sysctl.conf
````
Add at end of file :

`vm.swappiness = 10`
	
<i>This means when 10% of ram is only available, swap will activate</i>
	
###  Set VFS cache pressure 
	
<i>VFS cache pressure pushes the kernel to return memory being used for caching to the main pool of free memory</i>
	
Open:
```
sudo nano /etc/sysctl.conf
````

Add at end of sysctl.conf file:
	
`vm.vfs_cache_pressure=50`


###  Disables write access 
	
<i>Noatime mount option fully disables writing file access times to SSD every time you read a file, this reduces the writes to SSD therefore greatly increasing lifespan of SSD’s</i>
```
sudo nano /etc/fstab
```
<p align="center">
 <img src="https://i.imgur.com/pM1Mf4C.png" width=400px height=200px>	
	
###  Prevent out of memory 

> [!CAUTION]
> This tool is outdated and has not been updated for a while. If have issues try <a href="https://github.com/rfjakob/earlyoom"><b>earlyoom</b></a> or <a href="https://github.com/facebookincubator/oomd"><b>oomd</b></a>
	
Install <a href="https://github.com/hakavlad/nohang"><b>Nohang</b></a>:
```  
sudo add-apt-repository ppa:oibaf/test
sudo apt update
sudo apt install nohang
sudo systemctl enable --now nohang-desktop.service
```

***
**[⬆ BACK TO TOP ⬆](#contents)**

<h2 align="center">💻<b><i>BETTER CPU</b></i>💻</h2>
	
> [!WARNING]
> This tool is outdated and has not been updated for a while. Please use <a href="https://github.com/AdnanHodzic/auto-cpufreq"><b>auto-cpufreq</b></a>. Have not have time to use it and write quick tutorial.

###  Manage processes IO and CPU priorities with <a href="https://github.com/Nefelim4ag/Ananicy"><b>Ananicy</b></a> 
```
git clone https://github.com/Nefelim4ag/Ananicy.git /tmp/ananicy
cd /tmp/ananicy
sudo make install
sudo systemctl enable ananicy
sudo systemctl start ananicy
```
	
***
**[⬆ BACK TO TOP ⬆](#contents)**

<h2 align="center">🖱️<b><i>TOUCHPAD GESTURES</b></i>🖱️</h2>

###  Install <a href="https://github.com/JoseExposito/touchegg"><b>Touchegg</b></a> 
```
sudo add-apt-repository ppa:touchegg/stable
sudo apt update
sudo apt install touchegg
sudo systemctl enable touchegg.service
sudo systemctl start touchegg
mkdir -p ~/.config/touchegg && cp -n /usr/share/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf
```

Install <a href="https://github.com/JoseExposito/touche"><b>Touché</b></a> application in software manager to configure gestures 

or

Do it <a href="https://github.com/JoseExposito/touchegg#available-gestures"><b>maunally</b></a> from config file
```
sudo nano ~/.config/touchegg/touchegg.conf
```
<i>Here is my <a href="https://github.com/trinib/Awesome-Basic-Linux-Mint/blob/main/Touchegg_Settings.txt"><b>configuration</b></a> for reference</i>

***
**[⬆ BACK TO TOP ⬆](#contents)**

<h2 align="center">🎨<b><i>CUSTOMIZATION</b></i>🎨</h2>

<h3 align="center"><b><i>𝔼𝕐𝔼 ℂ𝔸ℕ𝔻𝕐</b></i> </h3>
<p align="center">
 <img src="https://i.imgur.com/E8S35nT.png" width=400px height=200px>	
	
###  All themes example here are from <a href="https://www.pling.com/s/Gnome/browse"><b>Pling</b></a> website.

#### <a href="https://www.pling.com/p/1445634/#files-panel"><b>Rainbow cursor</b></a>

Extract zip files to `/usr/share/icons/ `

#### <a href="https://www.gnome-look.org/p/1253385/"><b>Sweet dark ui theme</b></a>

Extract zip files to `/usr/share/themes/ `

#### <a href="https://www.cinnamon-look.org/p/1425426"><b>Beautyline icon theme</b></a>
Extract zip files to `/usr/share/icons/`
	
###  Applets 
	
#### <a href="https://cinnamon-spices.linuxmint.com/applets/view/281"><b>CinnVIIStarkMenu</b></a>
#### <a href="https://cinnamon-spices.linuxmint.com/applets/view/106"><b>CPU Temp Indicator</b></a>
#### <a href="https://cinnamon-spices.linuxmint.com/applets/view/79"><b>Multicore System Monitor</b></a>

###  Dock 

Install <a href="https://launchpad.net/plank"><b>plank</b></a> dock from software manager

#### <a href="https://www.gnome-look.org/p/1257556/"><b>Cyberpunk plank theme</b></a>

Extract zip files to `/usr/share/plank/themes/`
	
###  Boot Logo 
	
#### <a href="https://github.com/topics/plymouth-themes"><b>Plymouth Themes</b></a>

Copy theme folder to `/usr/share/plymouth/themes/`
	
#### Install the new theme (<a href="https://raw.githubusercontent.com/adi1090x/files/master/plymouth-themes/previews/22.gif"><b>cybernetic</b></a> in this case)
```
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/cybernetic/cybernetic.plymouth 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u	
```
	
***
**[⬆ BACK TO TOP ⬆](#contents)**

<h2 align="center">📥<b><i>SOFTWARES</b></i>📥</h2>

### <a href="https://www.oracle.com/java/technologies/downloads/"><b>Java</b></a> (Running Programs)

_VERSION 17_
```
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb
chmod +x jdk-17_linux-x64_bin.deb
sudo dpkg -i jdk-17_linux-x64_bin.deb
```

_VERSION 21_
```
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
chmod +x jdk-21_linux-x64_bin.deb
sudo dpkg -i jdk-21_linux-x64_bin.deb
```	
	
###  <a href="https://www.winehq.org/"><b>Wine</b></a> (Install Windows Softwares) 
```
sudo dpkg --add-architecture i386 
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
sudo apt install --install-recommends winehq-stable
```
	
###  <a href="https://anbox-cloud.io/"><b>Anbox Cloud</b></a> (Android Emulator) 

## Install using Snap Store
```
sudo apt install snapd
sudo snap install anbox-cloud-appliance --classic
```
- Open https://your-machine-address/applications in your browser. By default, the Anbox Cloud Appliance uses self-signed certificates, which might cause a security warning in your browser. Use the mechanism provided by your browser to proceed to the web page.
- Click Add Application.
- Enter a name for the application, for example, virtual-device-web.
- Keep the preselected resource type.
- Select the Android image that you want to use, for example, jammy:android13:arm64.
- Do not upload an APK file.
- Click Add Application. You are redirected to the application view. Wait until the application status changes to ready.
	
###  <a href="https://lutris.net/"><b>Lutris</b></a> (Game Library Manager) 
<a href="https://www.youtube.com/watch?v=oHDkeQ9eDrc"><b>Demo</b></a>
```
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris
```
	
###  <a href="https://getmailspring.com/"><b>Mailspring</b></a> (Mail Client) 
```
sudo snap install mailspring
	
## Or manually
wget https://updates.getmailspring.com/download?platform=linuxDeb
sudo chmod +x name_of_file.deb
sudo dpkg -i /path/to/deb/file
```
	
###  <a href="https://ravenreader.app/"><b>Raven Reader</b></a> (Rss News)
```
sudo snap install raven-reader
```
	
###  <a href="https://www.qbittorrent.org/"><b>qBittorrent</b></a> (Torrenting Client) 
```	
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt-get update
sudo apt install qbittorrent
```

###  <a href="https://github.com/lpereira/hardinfo"><b>Hardinfo</b></a> (System Information)  
```
sudo add-apt-repository ppa:linuxuprising/hardinfo
sudo apt update
sudo apt install hardinfo
```
###  <a href="https://www.bleachbit.org/features"><b>Bleachbit</b></a> (Clean System) 
 ```
sudo apt install bleachbit
```	
###  <a href="https://oguzhaninan.github.io/Stacer-Web/"><b>Stacer</b></a> (System Optimizer & Monitoring) 
```
sudo add-apt-repository ppa:oguzhaninan/stacer -y
sudo apt-get update
sudo apt-get install stacer -y
```

###  <a href="https://invent.kde.org/multimedia/haruna"><b>Haruna</b></a> (Video player & Youtube-dl)  
```
flatpak install flathub org.kde.haruna
```
###  <a href="https://shutter-project.org/"><b>Shutter</b></a> (Screenshot tool) 
```
sudo add-apt-repository ppa:shutter/ppa
sudo apt-get update
sudo apt install shutter
```
	
***
**[⬆ BACK TO TOP ⬆](#contents)**

<h2 align="center">🎮<b><i>Retro Gaming</b></i>🎮</h2>
	
<p align="center">
<img src="https://user-images.githubusercontent.com/18756975/168472926-e3c0fb71-89f8-4f33-8d24-d0dfdd90973d.gif">

###  Install <a href="https://retropie.org.uk/docs/Debian/"><b>RetroPi</b></a>
	
▶<a href="https://youtu.be/hyZcGG5QMuk?t=337"><b>Video tutorial</b></a><br>
```
sudo apt install -y git dialog unzip xmlstarlet
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
cd RetroPie-Setup
sudo ./retropie_setup.sh
```
		
###  Install <a href="https://retropie.org.uk/docs/Themes/"><b>Themes</b></a>  

▶<a href="https://www.youtube.com/watch?v=PZwRfLlh01M&t=37s"><b>Video tutorial</b></a>
	
#### Install more themes from <a href="https://github.com/RetroHursty69/HurstyThemes">RetroHursty69<b></b></a>
	
▶<a href="https://youtu.be/CRC_ENX8Z4E?t=126"><b>Video tutorial</b></a><br>
```
wget https://raw.githubusercontent.com/RetroHursty69/HurstyThemes/master/install.sh
chmod +x "install.sh"
./install.sh

## Restart Emulation Station and you should then see the new script in the RetroPie menu.
```

###  Install <a href="https://retropie.org.uk/docs/Shaders-and-Smoothing/"><b>Shaders</b></a> 
	
▶<a href="https://www.youtube.com/watch?v=Jm1vGJRAutU&t=76s"><b>Video tutorial</b></a>
		
Get more shaders from <a href="https://github.com/libretro/glsl-shaders"><b>glsl-shaders</b></a>, Extract <a href="https://github.com/libretro/glsl-shaders/archive/refs/heads/master.zip"><b>zip</b></a> to `~/.config/retroarch/shaders` folder.
	
###  The <a href="https://github.com/thebezelproject/BezelProject"><b>Bezel Project</b></a>  
	
![index](https://user-images.githubusercontent.com/18756975/168470041-11f11782-209b-47b8-9dbd-405a6338c6c6.jpg)
	
▶<a href="https://youtu.be/uq8IecVQ6yY?t=233"><b>Video tutorial</b></a><br>
```
cd /home/pi/RetroPie/retropiemenu/
wget https://raw.githubusercontent.com/thebezelproject/BezelProject/master/bezelproject.sh
chmod +x "bezelproject.sh"
	
## Restart Emulation Station and you should then see the new script in the RetroPie menu.
```
	
> [!TIP]
> <i> For **FREE** rom packs & bios files, go to <a href="https://www.arcadepunks.com/download-raspberry-pi-4-images/"><b>Arcade Punks</b></a> and download a Raspberry Pi custom build image using torrents. Then you can mount image file in linux and view contents. Search for roms&bios folders/files and extract them to retropi directories on your Linux system.</i><br><a href="https://www.arcadepunks.com/download-raspberry-pi-4-images/"><img src="https://user-images.githubusercontent.com/18756975/168478268-5001d1f6-1b5d-4273-9eb5-2cca4f740a74.png" width=220px height=70px></a>

***
**[⬆ BACK TO TOP ⬆](#contents)**
	
<h2 align="center">🔳<b><i>TERMINAL</b></i>🔳</h2>

###  Cool Bash 

Customize your terminal like a boss
<p align="left">
 <img src="https://i.imgur.com/Cpb3eiX.png" width=400px height=280px>
 
<a href="https://en.wikipedia.org/wiki/Cowsay"><b>COWSAY</b></a>(can be used with<a href="https://en.wikipedia.org/wiki/Fortune_(Unix)#Common_options"><b> fortune</b></a>)
   
    sudo apt-get install cowsay

<a href="https://github.com/busyloop/lolcat"><b>LOLCAT</b></a>

    sudo apt-get install ruby
    sudo gem install lolcat

<a href="http://caca.zoy.org/wiki/toilet"><b>TOILET</b></a>

    sudo apt install toilet

<a href="http://www.figlet.org/"><b>FIGLET</b></a>

    sudo apt install figlet
	
Information needed for customizing bash :
 
<a href="https://misc.flogisoft.com/bash/tip_colors_and_formatting"><b>Bash colors</b></a>

<a href="https://textfancy.com/"><b>Fancy texts</b></a>

<a href="https://asciiart.website/"><b>ASCHII art</b></a>

<a href="https://theasciicode.com.ar/"><b>ASCII table</b></a>	
	
Everything is added and edited at the end of bashrc file :

    sudo nano /.bashrc	

<i>Here is an <a href="https://github.com/trinib/Awesome-Linux-Mint/blob/main/bashrc"><b>example</b></a> for reference</i>
    
###  Pimp out <a href="https://github.com/dylanaraps/neofetch"><b>Neofetch</b></a>  (can be added to bashrc)
 
<img src="https://i.imgur.com/w21XtAG.png" width=400px height=280px>    
 
Open neofetch config file to edit :
 
    sudo nano ~/.config/neofetch/config.conf

To add custom ASCII art work, you need to create a <a href="https://github.com/trinib/Awesome-Basic-Linux-Mint/blob/main/ascii_art_example.txt"><b>txt file (with the art)</b></a> in your home directory and add <i><a href="https://github.com/trinib/Awesome-Basic-Linux-Mint/blob/f8bf66934e6d0710fd1816d817aad1b2f4e47961/neofetch.conf#L695"><b>file path</b></a></i> to neofetch config file 

<i>Here is an <a href="https://github.com/trinib/Awesome-Basic-Linux-Mint/blob/main/neofetch.conf"><b>example</b></a> for reference</i>

#
###  Use Oh-My-Fish 
	
Instead of linux bash you can use fish shell which has cool features like my favourite <i><b>auto predictions preview</b></i>
	
Fish is a Unix shell with a focus on interactivity and usability. Oh My Fish provides core infrastructure to allow you to install packages which extend or modify the look of your shell. It's fast, extensible and easy to use
	
Install <a href="https://fishshell.com/"><b>fish</b></a> :
```	
sudo apt install fish
```	
	
Install <a href="https://github.com/oh-my-fish/oh-my-fish"><b>oh-my-fish</b></a> :
```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

Set fish to default shell :
```
fish --login
## REVERT
bash --login
```
	
Install <a href="https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md"><b>themes</b></a>
	
Customize current fish theme colors :
```
fish_config	
```
	
For startup greetings go to `.config/fish/functions` and create a file <a href="https://github.com/trinib/Awesome-Ubuntu-for-Beginners/blob/main/fish_greeting.fish"><b>fish_greeting.fish</b></a>
	
#	
### <a href="https://github.com/gennaro-tedesco/gh-s"><b>gh-s</b></a> - Search GitHub repositories interactively from the command line
	
<img src="https://i.imgur.com/8N1SLTB.png" width=500px height=250px>    

	
Install :
```
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```
	
Login authorization :
```
gh auth login
```
	
Install extension :	
```
gh extension install gennaro-tedesco/gh-s
```
	
Get Started :
```
gh s
```

***
**[⬆ BACK TO TOP ⬆](#contents)**

<h2 align="center">📚<b><i>LINUX RESOURSES</b></i>📚</h2>

###  Endless linux stuff 

<h2 align=center><table>
	<tr>
		<td>
			<a href="https://www.linuxuprising.com/">
				<img src="https://i.imgur.com/ghu8lV3.png" width=250px height=20px>
			</a>
		</td>
	        <td>
			<a href="https://www.omgubuntu.co.uk/">
				<img src="https://www.omgubuntu.co.uk/wp-content/themes/omgubuntu-theme-2023_10_0/images/logo.svg?v=20231008132253" width=200px height=50px>
			</a>
		</td>
		<td>
			<a href="https://www.phoronix.com/">
				<img src="https://www.phoronix.com/phxcms7-css/phoronix.png" width=210px height=80px>
			</a>
		</td
                </tr>
</table>
<table>
	<tr>
		<td>
			<a href="https://itsfoss.com/">
				<img src="https://itsfoss.com/content/images/size/w300/format/webp/2023/01/itsfoss-logo.png" width=200px height=80px>
			</a>
		</td>
		<td>
			<a href="https://www.fosslinux.com/">
				<img src="https://b1490832.smushcdn.com/1490832/wp-content/uploads/2020/01/fl_logo_v3.png?lossy=2&strip=1&webp=1" width=200px height=50px>
			</a>
		</td>
		<td>
			<a href="https://ubunlog.com/en/">
				<img src="https://i.imgur.com/dLzmWWM.jpg" width=200px height=70px>
			</a>
		</td>		
	</tr>
</table></h2>

****   

**[⬆ BACK TO TOP ⬆](#contents)**
