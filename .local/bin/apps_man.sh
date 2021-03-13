#!/usr/bin/env bash
##
##
folder="$HOME/.config/install_system"
2menu(){ dmenu -fn glisp -nb "#100" -nf "#b9c0af" -sb "#000" -sf "#afff2f" -i -b -l 22 -p "choice" ;}

awk(){
local AWK
AWK="$HOME/.config/install_system/SHELL/awk/AWK_Essential_Training"

declare -a options=(\
"awk *.{pdf,docx}"
"01.Insroduction/ >>"
"02.What Is AWK/ >>"
"03.AWK Command Line Basics/ >>"
"04.Understanding Records and Fields/ >>"
"05.Understanding Variables and Operators/ >>"
"06.A Quick Introduction to Regular Expressions/ >>"
"07.Using Control Structures/ >>"
"08.Formatting the Output/ >>"
"09.Functions and Arrays/ >>"
"10.Combining AWK with Other Tools/ >>"
"11.Conclusion/ >>"
"Exercice Files/ >>"
)

choice=$(echo "$(printf '%s\n' "${options[@]}")" | "2menu" 'Open file: ')
case "$choice" in
    "awk *.{pdf,docx}")
	    ls $folder/SHELL/awk/*.{pdf,docx}																				| 2menu | xargs -I {} open "{}" ;;
    "01.Introduction/ >>")
	    ls $AWK/01.\ Introduction/*																				| 2menu | xargs -I {} open "{}" ;;
    "02.What Is AWK/ >>")
	    ls $AWK/02.\ What\ Is\ AWK/*																			| 2menu | xargs -I {} open "{}" ;;
    "03.AWK Command Line Basics/ >>")
	    ls $AWK/03.\ AWK\ Command\ Line\ Basics/*													| 2menu | xargs -I {} open "{}" ;;
    "04.Understanding Records and Fields/ >>")
	    ls $AWK/04.\ Understanding\ Records\ and\ Fields/*								| 2menu | xargs -I {} open "{}" ;;
    "05.Understanding Variables and Operators/ >>")
	    ls $AWK/05.\ Understanding\ Variables\ and\ Operators/*						| 2menu | xargs -I {} open "{}" ;;
    "06.A Quick Introduction to Regular Expressions/ >>")
	    ls $AWK/06.\ A\ Quick\ Introduction\ to\ Regular\ Expressions/*		| 2menu | xargs -I {} open "{}" ;;
    "07.Using Control Structures/ >>")
	    ls $AWK/07.\ Using\ Control\ Structures/*													| 2menu | xargs -I {} open "{}" ;;
    "08.Formatting the Output/ >>")
	    ls $AWK/08.\ Formatting\ the\ Output/*														| 2menu | xargs -I {} open "{}" ;;
    "09.Functions and Arrays/ >>")
	    ls $AWK/09.\ Functions\ and\ Arrays/*															| 2menu | xargs -I {} open "{}" ;;
    "10.Combining AWK with Other Tools/ >>")
	    ls $AWK/10.\ Combining\ AWK\ with\ Other\ Tools/*									| 2menu | xargs -I {} open "{}" ;;
    "11.Conclusion/ >>")
	    ls $AWK/11.\ Conclusion/*																					| 2menu | xargs -I {} open "{}" ;;
    "Exercice Files/ >>")
			$TERMINAL -e lf $AWK/Exercice\ Files/
			;;
esac
}

#########################################################################################################
xar(){
case "$(printf "xargs" | 2menu)"  in
    "xargs")
	    ls $folder/SHELL/xargs/*.{pdf,docx}						| 2menu | xargs -n 1 -I {} open "{}" ;;
esac
}

#########################################################################################################
menu() { \
declare -a options=(\
	"awk >>"
	"emacs ->"
	"bash ->"
	"inkscape ->"
	"latex ->"
	"Other ->"
	"pytho3 ->"
	"vim ->"
	"xargs ->"
)

choice=$(echo "$(printf '%s\n' "${options[@]}")" | "2menu" 'Open file: ')
case "$choice" in
	"awk >>")				awk;;
	"emacs ->")			ls $folder/EMACS/*													| 2menu | xargs -I {} open "{}";;
	"bash ->")			ls $folder/SHELL/* | grep "bash*"						| 2menu | xargs -I {} open "{}" ;;
	"inkscape ->")	ls $folder/inkscape/*												| 2menu | xargs -I {} open "{}" ;;
	"latex ->")			ls $folder/latex/*													| 2menu | xargs -I {} open "{}" ;;
	"Other ->")			getkeys-dmenu;;
	"pytho3 ->")		ls $folder/Python3/*												| 2menu | xargs -I {} open "{}"  ;;
	"vim ->")				ls $folder/vim/Documention/*								| 2menu | xargs -I {} open "{}"  ;;
	"xargs")				xar;;
esac
}

#########################################################################################################
case "$1" in
	*) menu;;
esac
