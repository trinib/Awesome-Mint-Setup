<p align="center">
<img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" height=25px width=100px><img src="https://badges.frapsoft.com/os/v2/open-source-175x29.png?v=103" 25px width=100px><a href="https://www.kernel.org/category/about.html"><img src="https://badges.frapsoft.com/bash/v1/bash-200x34.png?v=103" height=25px width=100px><a href=""></a>

<h2 align="center"><b>Just what you needed !</b></h2>	
	
<h2 align="center"><b><i>Simple, important & cool resources after installing <a href="https://distrowatch.com/search.php?ostype=Linux&category=All&origin=All&basedon=Ubuntu&notbasedon=None&desktop=All&architecture=All&package=All&rolling=All&isosize=All&netinstall=All&language=All&defaultinit=All&status=Active#simple"><b>Ubuntu-based-distros</b></a></b></i></h2>
	    
<p align="center"><img src="https://i.imgur.com/SYiccUK.png" width=20%> 

# Contents
- [Kernels & Drivers](#%EF%B8%8Fcustom-kernels--drivers%EF%B8%8F-)
  - [XanMod](#xanmod)
  - [Liquorix](#liquorix)
  - [Graphic Drivers](#graphic-drivers)
- [Better Audio](#boost-audio-)
  - [Equalizer](#equalizer)
  - [Audio Tweaks](#audio-tweaks)
  - [Troubleshoot](#troubleshoot)
- [Longer Battery Life](#better-battery-)
  - [Install TLP package](#install-tlp-package)
  - [Disable Bluetooth](#disable-bluetooth)
  - [Turn Off Firewall Logs](#turn-off-firewall-logs)
  - [Disable Gome features](#disable-gome-features)
- [Optimize RAM&SSD](#optimize-ramssd-)
  - [Decrease swap](#decrease-swap)
  - [Set VFS cache pressure](#set-vfs-cache-pressure)
  - [Disables write access](#disables-write-access)
  - [Prevent out of memory](#prevent-out-of-memory)
  - [Command to free memory](#command-to-free-memory)
- [Better CPU Managment](#better-cpu-)
- [Touchpad Gestures](#touchpad-gestures-)
- [Customization](#customization-)
- [Software](#softwares-)
- [Retro Gaming](#install-retropi)
  - [Install RetroPi](#install-retropi)
  - [Install Themes](#install-themes)
  - [Install Shaders](#install-shaders)
  - [The Bezel Project](#the-bezel-project)
- [Linux Resources](#linux-resourses-)
- [Terminal](#terminal-)
  - [Cool Bash ](#cool-bash)
  - [Pimp out Neofetch](#pimp-out-neofetch--can-be-added-to-bashrc)
  - [Oh-My-fish](#use-oh-my-fish)
  - [Stop terminal sudo password](#stop-terminal-sudo-asking-for-password)
- [Useful Linux Commands](#useful-commands-)
***
#
<h2 align="center"><b><i>⚙️CUSTOM KERNELS & DRIVERS⚙️</b></i> </h2>

<i>Depending on the type of hardware you have one might work better than the other</i>

#### <a href="https://xanmod.org/"><b>XanMod</b></a>

    echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
    wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/xanmod-kernel.gpg add -
    sudo apt update && sudo apt install linux-xanmod
    
    ## FOR INTEL ##
    sudo apt install intel-microcode iucode-tool
    ## FOR AMD ##
    sudo apt install amd64-microcode

    echo 'net.core.default_qdisc = fq_pie' | sudo tee /etc/sysctl.d/90-override.conf
    sudo reboot

      
or

#### <a href="https://liquorix.net/"><b>Liquorix</b></a>

    sudo add-apt-repository ppa:damentz/liquorix && sudo apt-get update
    sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64
    sudo reboot
	
###  Graphic Drivers 
	
<a href="https://github.com/lutris/docs/blob/master/InstallingDrivers.md#nvidia"><b>Nvidia</b></a>

<a href="https://github.com/lutris/docs/blob/master/InstallingDrivers.md#amd--intel"><b>AMD / Intel</b></a>

***
	
#
<h2 align="center"><b><i>🔊BOOST AUDIO🔊</b></i> </h2>

###  Equalizer 
<a href="https://flathub.org/apps/details/com.github.wwmm.pulseeffects"><b>Pulse Effects</b></a> (can make soft speakers alot louder)
```
sudo apt-get install pulseeffects lsp-plugins
````
<a href="https://github.com/rsommerard/pulse-presets"><b>pulse-presets</b></a>

###  Audio Tweaks 
Check out this <a href="https://github.com/trinib/Awesome-Linux-Mint-Basics/blob/main/Enable%20High%20Quality%20Audio.md"><b>guide</b></a>

###  Troubleshoot 
If there is any issue with your audio like *_lag_* or in my case *_louder volume_* feature was not working, I found this fix on mint forums :
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
#
<h2 align="center"><b><i>🔋BETTER BATTERY🔋</b></i> </h2>

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
#
<h2 align="center"><b><i>🚀OPTIMIZE RAM&SSD🚀</b></i> </h2>

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
	
Install <a href="https://github.com/hakavlad/nohang"><b>Nohang</b></a>:
```  
sudo add-apt-repository ppa:oibaf/test
sudo apt update
sudo apt install nohang
sudo systemctl enable --now nohang-desktop.service
```
###  Command to free memory 
```
sync; sudo echo 2 | sudo tee /proc/sys/vm/drop_caches
```
Check out this <a href="https://gist.github.com/trinib/0ae1e7cd56178358ee28bb0828daab4f"><b>guide</b></a> to make a script and execute it at a certain time

***
#
<h2 align="center"><b><i>💻BETTER CPU💻</b></i> </h2>

###  Manage processes IO and CPU priorities with <a href="https://github.com/Nefelim4ag/Ananicy"><b>Ananicy</b></a> 
```
git clone https://github.com/Nefelim4ag/Ananicy.git /tmp/ananicy
cd /tmp/ananicy
sudo make install
sudo systemctl enable ananicy
sudo systemctl start ananicy
```
***
#
<h2 align="center"><b><i>🔧TOUCHPAD GESTURES🔧</b></i> </h2>

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
#
<h2 align="center"><b><i>🎨CUSTOMIZATION🎨</b></i> </h2>

<h3 align="center"><b><i>𝔼𝕐𝔼 ℂ𝔸ℕ𝔻𝕐</b></i> </h3>
<p align="center">
 <img src="https://i.imgur.com/E8S35nT.png" width=400px height=200px>	
	
###  All linux themes from <a href="https://www.pling.com/s/Gnome/browse"><b>Pling</b></a> website 

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
#
<h2 align="center"><b><i>📥SOFTWARES📥</b></i> </h2>
	
### <a href="https://app-outlet.github.io/"><b>App Outlet</b></a> (Universal App Store)
Install from https://www.pling.com/p/1355468/
	
#### Or build manually
- An .deb file
- An .tar.gz file
- A folder linux-unpacked folder with the unpacked app
```
sudo apt install nodejs git npm
git clone https://github.com/app-outlet/app-outlet.git
cd app-outlet
npm install
npm run start
npm run build
```

### <a href="https://www.oracle.com/java/technologies/downloads/"><b>Java</b></a> (Running Programs)
```
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java17-installer --install-recommends

## Or manually (would not auto-update)
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb
chmod +x jdk-17_linux-x64_bin.deb
sudo dpkg -i jdk-17_linux-x64_bin.deb
```	
	
###  <a href="https://www.winehq.org/"><b>Wine</b></a> (Install Windows Softwares) 
```
sudo dpkg --add-architecture i386 
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
sudo apt install --install-recommends winehq-stable
```
	
###  <a href="https://anbox.io/"><b>Anbox</b></a> (Android Emulator) 
```
## Install kernel modules
sudo add-apt-repository ppa:morphis/anbox-support
sudo apt update
sudo apt install linux-headers-generic anbox-modules-dkms
	
## Install using Snap Store
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install snapd
snap install --devmode --beta anbox
	
## The snap will not automatically update. In order to update to a newer version you can run:
snap refresh --beta --devmode anbox
```
	
###  <a href="https://getmailspring.com/"><b>Mailspring</b></a> (Mail Client) 
```
sudo snap install mailspring
	
## Or manually
wget https://updates.getmailspring.com/download?platform=linuxDeb
sudo chmod +x name_of_file.deb
sudo dpkg -i /path/to/deb/file
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
###  <a href="https://www.bleachbit.org/features"><b>Bleachbit</b></a> (Clean Linux) 
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
#
<h2 align="center"><b><i>🕹️Retro Gaming🕹️</b></i> </h2>

###  Install <a href="https://retropie.org.uk/docs/Debian/"><b>RetroPi</b></a> 
```
sudo apt install -y git dialog unzip xmlstarlet
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
cd RetroPie-Setup
sudo ./retropie_setup.sh
```
▶<a href="https://youtu.be/hyZcGG5QMuk?t=337"><b>Video tutorial</b></a>◀
		
###  Install <a href="https://retropie.org.uk/docs/Themes/"><b>Themes</b></a>  

▶<a href="https://www.youtube.com/watch?v=PZwRfLlh01M&t=37s"><b>Video tutorial</b></a>◀
	
#### Install more themes from <a href="https://github.com/RetroHursty69/HurstyThemes">RetroHursty69<b></b></a>
```
wget https://raw.githubusercontent.com/RetroHursty69/HurstyThemes/master/install.sh
chmod +x "install.sh"
./install.sh

## Restart Emulation Station and you should then see the new script in the RetroPie menu
```
▶<a href="https://youtu.be/CRC_ENX8Z4E?t=126"><b>Video tutorial</b></a>◀

###  Install <a href="https://retropie.org.uk/docs/Shaders-and-Smoothing/"><b>Shaders</b></a> 
	
▶<a href="https://www.youtube.com/watch?v=Jm1vGJRAutU&t=76s"><b>Video tutorial</b></a>◀
		
Get more shaders from <a href="https://github.com/libretro/glsl-shaders"><b>glsl-shaders</b></a>, Extract <a href="https://github.com/libretro/glsl-shaders/archive/refs/heads/master.zip"><b>zip</b></a> to `~/.config/retroarch/shaders` folder <i>(`~/` means home directory)</i>.
	
###  The <a href="https://github.com/thebezelproject/BezelProject"><b>Bezel Project</b></a>  
```
cd /home/pi/RetroPie/retropiemenu/
wget https://raw.githubusercontent.com/thebezelproject/BezelProject/master/bezelproject.sh
chmod +x "bezelproject.sh"
	
## Restart Emulation Station and you should then see the new script in the RetroPie menu.
```
▶<a href="https://youtu.be/uq8IecVQ6yY?t=233"><b>Video tutorial</b></a>◀
	
Tip :
<i> For rom packs & bios files, go to <a href="https://www.arcadepunks.com/download-raspberry-pi-4-images/"><b>Arcade Punks</b></a> and download a Raspberry Pi custom build image using torrents. Then you can mount image file in linux and view contents. Search for roms&bios folders/files and extract them to retropi directories </i>
	
***
#
<h2 align="center"><b><i>📚LINUX RESOURSES📚</b></i> </h2>

###  Endless linux stuff 

<table>
	<tr>
		<td>
			<a href="https://www.linuxuprising.com/">
				<img src="https://i.imgur.com/ghu8lV3.png" width=250px height=20px>
			</a>
		</td>
		<td>
			<a href="https://linoxide.com/">
				<img src="https://linoxide.com/wp-content/uploads/2013/10/linoxide-logo.png" width=210px height=80px>
			</a>
		</td>
		<td>
			<a href="https://www.omgubuntu.co.uk/">
				<img src="https://www.omgubuntu.co.uk/wp-content/themes/omgubuntu-theme-2021_10_0/images/logo.svg?v=20210304085925" width=200px height=50px>
			</a>
		</td>
		<td>
			<a href="https://itsfoss.com/">
				<img src="https://itsfoss.com/wp-content/uploads/2019/12/itsfoss_homepage.png" width=200px height=80px>
			</a>
		</td>
		<td>
			<a href="https://www.fosslinux.com/">
				<img src="https://786647.smushcdn.com/1490832/wp-content/uploads/2020/01/fl_logo_v3.png?lossy=1&strip=1&webp=1" width=200px height=50px>
			</a>
		</td>
	</tr>
</table>

***
#
<h2 align="center"><b><i>🔳TERMINAL🔳</b></i> </h2>

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
	
Install <a href="https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md"><b>themes</b></a>
	
Customize current fish theme colors :
```
fish_config	
```
	
For startup greetings go to `.config/fish/functions` and create a file <a href="https://github.com/trinib/Awesome-Ubuntu-for-Beginners/blob/main/fish_greeting.fish"><b>fish_greeting.fish</b></a>
	
#
###  Stop terminal sudo asking for password 

Open: 

    sudo nano -w /etc/sudoers

Change the line that says:

`%sudo  ALL=(ALL) ALL` 

into 

`%sudo  ALL=(ALL) NOPASSWD:ALL`

or:

`%sudo  ALL=(ALL:ALL) NOPASSWD:ALL` (to allow any group as well as any user).

***   
#	
<h2 align="center"><b><i>📋USEFUL COMMANDS📋</b></i> </h2>

1. `man` (used for getting manuals for specific command example: `man ls` gets manual for `ls` command)
2. `ping` (used for checking connection)
3. `cd` (Changing your directories)
4. `cat` (list the content of the desired file)
5. `nano` (Simple Text editor , quick&fast)
6. `locate` (Searching with command line , (*)has other options too
7. `--purge remove` (Uninstall packages and clean up files)
8. `history | grep`  (Search history for specific word)
9. `rm` (Remove files/folders)
10. `cd $home` (return to home directory where ever you are)

<i>Here is more <a href="https://github.com rinib/Awesome-Linux-Mint/blob/main/Linux%20Basic%20Commands%20Every%20User%20Should%20Know.md"><b>COMMANDS</b></a> </i>
#

**[⬆ BACK TO TOP ⬆](#contents)**
