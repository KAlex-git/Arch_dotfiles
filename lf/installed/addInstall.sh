pack="mediainfo odt2txt highlight atool odt2txt w3m pdftotext"

[[ ! -z "/usr/bin/$pack" ]] || yay -S $pack

pathfull="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"

if [[ -f "$pathfull/epub_thumb.tgz" ]]; then
cd "$pathfull";
tar -zxvf epub_thumb.tgz;
cd epub_thumb/; sudo python install.py install >/dev/null 2>&1;
cd ../;
printf "installed\n"
rm -rf ./epub_thumb
fi
