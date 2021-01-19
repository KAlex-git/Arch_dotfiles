#!/usr//bin/sh
##
#source $HOME/.local/bin/shellColor.sh
##
##

### Sync folder "home"
sd="$(/mnt/usb/OS/Linux_OS/backup/alex)"

# Folders
sudo rsync -arvz --progress  "$HOME/Desktop"				"$sd/"
sudo rsync -arvz --progress  "$HOME/Documents"			"$sd/"
sudo rsync -arvz --progress  "$HOME/Downloads"			"$sd/"
sudo rsync -arvz --progress  "$HOME/Pictures"			"$sd/"
sudo rsync -arvz --progress  "$HOME/Music"					"$sd/"
sudo rsync -arvz --progress  "$HOME/Videos"				"$sd/"
sudo rsync -arvz --progress  "$HOME/www"						"$sd/"
sudo rsync -arvz --progress  "$HOME/build"					"$sd/"
sudo rsync -arvz --progress  "$HOME/dev"						"$sd/"
sudo rsync -arvz --progress  "$HOME/GDisk"					"$sd/"
sudo rsync -arvz --progress  "$HOME/SKE"						"$sd/"
sudo rsync -arvz --progress  "$HOME/tmp"						"$sd/"
sudo rsync -arvz --progress  "$HOME/vimwiki"				"$sd/"
sudo rsync -arvz --progress  "$HOME/.dotfiles"			"$sd/"
sudo rsync -arvz --progress  "$HOME/.config"				"$sd/"
sudo rsync -arvz --progress  "$HOME/.local"				"$sd/"
sudo rsync -arvz --progress  "$HOME/.abook"				"$sd/"
sudo rsync -arvz --progress  "$HOME/.gnupg"				"$sd/"
sudo rsync -arvz --progress  "$HOME/.npm"					"$sd/"
sudo rsync -arvz --progress  "$HOME/.ssh"					"$sd/"
sudo rsync -arvz --progress  "$HOME/.stardict"			"$sd/"
sudo rsync -arvz --progress  "$HOME/.texlive"			"$sd/"
sudo rsync -arvz --progress "$HOME/.fzf"						"$sd/"
sudo rsync -arvz --progress "$HOME/.npm"						"$sd/"

# Files
sudo rsync -arvz --progress  "$HOME/.fzf.bash"			"$sd/"
sudo rsync -arvz --progress  "$HOME/.fzf.zsh"			"$sd/"
sudo rsync -arvz --progress  "$HOME/.gitconfig"		"$sd/"
sudo rsync -arvz --progress  "$HOME/.gitmodules"		"$sd/"
sudo rsync -arvz --progress  "$HOME/.mbsyncrc"			"$sd/"
sudo rsync -arvz --progress  "$HOME/.xinitrc"			"$sd/"
sudo rsync -arvz --progress  "$HOME/noiseclean.sh"	"$sd/"

##
##    ##folder {.config}
		#rsync -avzur --delete --progress "$HOME/.cache"			"$sd"
