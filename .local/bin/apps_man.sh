#!/usr/bin/env bash
##
##
folder="$HOME/.config/install_system/"
2menu(){ dmenu -fn glisp -nb "#100" -nf "#b9c0af" -sb "#000" -sf "#afff2f" -i -l 22 -p "choice" ;}

awk(){
local AWK
AWK="$HOME/.config/install_system/awk/AWK_Essential_Training"
case "$(printf "awk >>\\n01.Introduction/ >>\\n02.What Is AWK/ >>\\n03.AWK Command Line Basics/ >>\\n04.Understanding Records and Fields/ >>\\n05.Understanding Variables and Operators/ >>\\n06.A Quick Introduction to Regular Expressions/ >>\\n07.Using Control Structures/ >>\\n08.Formatting the Output/ >>\\n09.Functions and Arrays/ >>\\n10.Combining AWK with Other Tools/ >>\\n11.Conclusion/ >>\\nExercice Files/ >>" | dmenu -fn glisp -nb "#100" -nf "#b9c0af" -sb "#000" -sf "#afff2f" -i -l 22 -p "choice viewer: ")"  in
    "awk >>")
	    ls $folder/awk/*.{pdf,docx}																				| 2menu | xargs -I {} open "{}" ;;
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
	    ls $AWK/Exercice\ Files/*																					| 2menu | xargs -I {} open "{}" ;;
esac
}

xar(){
case "$(printf "xargs" | dmenu -fn glisp -nb "#100" -nf "#b9c0af" -sb "#000" -sf "#afff2f" -i -l 22 -p "choice viewer: ")"  in
    "xargs")
	    ls $folder/SHELL/xargs/*.{pdf,docx}						| 2menu | xargs -n 1 -I {} open "{}" ;;
esac
}

menu() { \
choice=$(printf "nawk\\nxargs\\nbash ->\\ninkscape ->\\nlatex ->\\nOther ->\\nvim ->\\nncmpcpp" | dmenu -fn glisp -nb "#100" -nf "#b9c0af" -sb "#000" -sf "#afff2f" -i -l 22 -p "choice viewer: ")
case "$choice" in
	"Other ->") getkeys-dmenu;;
	awk) awk;;
	xargs) xar;;
	"bash ->") 	ls $folder/SHELL/* | grep "bash*"													| 2menu | xargs -I {} open "{}" ;;
	"inkscape ->")	ls $folder/inkscape/*																	| 2menu | xargs -I {} open "{}" ;;
	"latex ->")	ls $folder/latex/*																				| 2menu | xargs -I {} open "{}" ;;
	"vim ->") 	ls $folder/vim/Documention/*															| 2menu | xargs -I {} open "{}"  ;;
esac
}


case "$1" in
	*) menu;;
esac
