#!/usr//bin/sh
##
#source $HOME/.local/bin/shellColor.sh
##
##
##--include - это то, что мы включаем в синхронизацию (в нашем случае все что начинается на n)
##--exclude - это то, что мы исключаем (в нашем случае все остальное)
##
## rsync -avz --include 'n*' --exclude '*' root@192.168.0.5:/home/sysadmin/temp/ /home/greendail/temp

input="$$HOME/.local/ $HOME/.config/ $HOME/vimwiki/"
outputUSB="/mnt/usb/"


# исключения
share="$($HOME/.local/share/)"
neverwinternight="$HOME/.config/install_system/neverwinternight_diamont/"

	rsync -avzhv --exclude "$neverwinternight" --exclude "$share"  $input $outputUSB



#[ -d /run/media/alex/ ] && echo "folder '/run/media/alex/ ' have " || sudo mkdir -p /run/media/alex/
#sudo mount /dev/sda6 /run/media/alex/
### Sync folder "home"
#    bkhome_sda6="/run/media/alex/alex/"
##
##    ##folder {.config}
#    rsync -avzur --delete  $bkhome_sda6/Desktop     		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/Documents  		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/Downloads  		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/MYSECRETDOC 		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/Pictures  		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/Music 			"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/Videos  		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/www  			"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/.dotfiles  		"$HOME/"
##    rsync -avzur --delete --progress $bkhome_sda6/.cache      "$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/.config 		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/.icons  		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/.fonts  		"$HOME/"
##    rsync -avzur --delete --progress $bkhome_sda6/.fzf        "$HOME/"
##    rsync -avzur --delete --progress $bkhome_sda6/.npm        "$HOME/"
##    rsync -avzur --delete --progress $bkhome_sda6/.local      "$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/.scripts  		"$HOME/"
#    rsync -avzur --delete  $bkhome_sda6/.wine  			"$HOME/"
#
#    rsync -avur --delete  $bkhome_sda6/urls.txt			"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.bashrc 			"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.bash_completion		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.inputrc			"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.gitignore		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.gitconfig		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.fzf.bash		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.vimrc.bak		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.tmux.conf  		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.xbindkeysrc  		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.Xdefaults 	        "$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.xinitrc 		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.Xresources  		"$HOME/"
#    rsync -avur --delete  $bkhome_sda6/.xvkbd  			"$HOME/"
#
#	## create link
#	[ -f "$HOME/aliasrc" ] && echo "link have 'aliasrc'" || sudo ln -sf $HOME/.config/aliasrc $HOME/aliasrc
#	[ -f "$HOME/.profile" ] && echo "link have '.profile'" || sudo ln -sf $HOME/.config/.profile $HOME/.profile
#	[ -f "$HOME/.xprofile" ] && echo "link have '.xprofile'" || sudo ln -sf $HOME/.config/.profile $HOME/.xprofile
#	[ -f "$HOME/windat" ] && echo "link have 'windat'" || sudo ln -sf "$HOME/.wine/drive_c/Program Files/Tracker Software/PDF Viewer/" $HOME/windat
#	[ -d "$HOME/.vim" ] && echo "link have '.vim'" || sudo ln -sf $HOME/.config/.nvim $HOME/.vim
#	[ -f "$HOME/.vimrc" ] && echo "link have '.vimrc'" || sudo ln -sf $HOME/.config/.nvim/init.vim $HOME/.vimrc
#
