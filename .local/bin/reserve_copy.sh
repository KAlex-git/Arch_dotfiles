#!/usr//bin/sh
##
#source $HOME/.local/bin/shellColor.sh
##
##
### TODO checking a start root previlegies
#if [[ $UID != 0 ]]; then
#    echo "Please run this script with sudo:"
#    echo "sudo $0 $*"
#    exit 1
#fi
#

### TODO
backup(){
### Sync folder "home"
sd="/mnt/usb/OS/Linux_OS/alex"

### Folders
rsync -arvz --progress  "$HOME/Documents"			"$sd"
rsync -arvz --progress  "$HOME/Downloads"			"$sd"
rsync -arvz --progress  "$HOME/Pictures"			"$sd"
rsync -arvz --progress  "$HOME/Music"					"$sd"
rsync -arvz --progress  "$HOME/Videos"				"$sd"
rsync -arvz --progress  "$HOME/www"						"$sd"
rsync -arvz --progress  "$HOME/build"					"$sd"
rsync -arvz --progress  "$HOME/dev"						"$sd"
rsync -arvz --progress  "$HOME/GDisk"					"$sd"
rsync -arvz --progress  "$HOME/SKE"						"$sd"
rsync -arvz --progress  "$HOME/tmp"						"$sd"
rsync -arvz --progress  "$HOME/projects"						"$sd"
rsync -arvz --progress  "$HOME/vimwiki"				"$sd"
rsync -arvz --progress  "$HOME/.dotfiles"			"$sd"
rsync -arvz --progress  "$HOME/.config"				"$sd"
rsync -arvz --progress  "$HOME/.local"				"$sd"
rsync -arvz --progress  "$HOME/.abook"				"$sd"
rsync -arvz --progress  "$HOME/.gnupg"				"$sd"
rsync -arvz --progress  "$HOME/.npm"					"$sd"
rsync -arvz --progress  "$HOME/.ssh"					"$sd"
rsync -arvz --progress  "$HOME/.stardict"			"$sd"
rsync -arvz --progress  "$HOME/.texlive"			"$sd"
rsync -arvz --progress "$HOME/.fzf"						"$sd"
rsync -arvz --progress "$HOME/.npm"						"$sd"
rsync -arvz --progress "$HOME/.xmonad"				"$sd"
### Files
rsync -arvz --progress  "$HOME/.fzf.bash"			"$sd"
rsync -arvz --progress  "$HOME/.fzf.zsh"			"$sd"
rsync -arvz --progress  "$HOME/.gitconfig"		"$sd"
rsync -arvz --progress  "$HOME/.gitmodules"		"$sd"
rsync -arvz --progress  "$HOME/.mbsyncrc"			"$sd"
rsync -arvz --progress  "$HOME/.xinitrc"			"$sd"

###
### folder {.config}
#rsync -avzur --delete --progress "$HOME/.cache"			"$sd"
}


### TODO
### Finded storage mount and backup
storage="$(blkid | grep "CA3A00" | awk '{print$1}' | sed 's/\://')"

if [[ "$(blkid | grep -o "CA3A00")" == "CA3A00" ]]
then
	if [[ -d /mnt/usb ]];then
    backup
	else
		print "Create directory"
		sudo mkdir /mnt/usb
		notify-send "A finded storage '500GB' 'please one minute'"
		sudo mount "$storage" /mnt/usb
    backup
	fi
else
  notify-send "Err"
  notify-send "A finded storage '500GB' 'please one minute'"
  sudo mount "$storage" /mnt/usb
    backup
fi
