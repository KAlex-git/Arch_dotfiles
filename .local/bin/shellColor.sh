#!/usr/bin/env bash
##
##

#
#Set Colors
#

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

#
# Headers and  Logging
#

e_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
}
e_arrow() { printf "➜ $@\n"
}
e_success() { printf "${green}✔ %s${reset}\n" "$@"
}
e_error() { printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { printf "${bold}%s${reset}\n" "$@"
}
e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}


#
# меню подтверждения
#
seek_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

# подтверждения
is_confirmed() {
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  return 0
fi
return 1
}

# типа Выхода
type_exists() {
if [ $(type -P $1) ]; then
  return 0
fi
return 1
}

# типа OC
is_os() {
if [[ "${OSTYPE}" == $1* ]]; then
  return 0
fi
return 1
}

#
# Уведомления
#
# для превого раза его нужно зарегистрироваться на  "https://pushover.net/"
#файковая почта - нужна для настройки
#			xrmc74bk8o@pomail.net
# Мой user key:
#					uouee1528u3ntd845fy7xxa1ipa3n4
# Мой email
#					https://pushover.net/verify/vpog2nef76531akkz98xzxk664rgpm
#
#
# curl -s \
#   --form-string "token=a9vk5etexqzcfzhuepg9vkzvs5ower" \
#   --form-string "user=uouee1528u3ntd845fy7xxa1ipa3n4" \
#   --form-string "message=Следи за собой потому, что следят за тобой" \
#   https://api.pushover.net/1/messages.json
#
#
# for example:  pushover "We just task"
pushover () {
    PUSHOVERURL="https://pushover.net/verify/vpog2nef76531akkz98xzxk664rgpm"
		API_KEY="aitb2hvviw817zrdb28xmy4v3ne8bc"
		USER_KEY="uouee1528u3ntd845fy7xxa1ipa3n4"
    DEVICE="uouee1528u3ntd845fy7xxa1ipa3n4"

  TITLE="${1}"
  MESSAGE="${2}"

  curl \
  -F "token=${API_KEY}" \
  -F "user=${USER_KEY}" \
  -F "device=${DEVICE}" \
  -F "title=${TITLE}" \
  -F "message=${MESSAGE}" \
  "${PUSHOVERURL}" > /dev/null 2>&1
}

#
# установка
# нужно отредактировать, так как он написан для MAC
#function to_install() {
#  local debug desired installed i desired_s installed_s remain
#  if [[ "$1" == 1 ]]; then debug=1; shift; fi
#    # Convert args to arrays, handling both space- and newline-separated lists.
#    read -ra desired < <(echo "$1" | tr '\n' ' ')
#    read -ra installed < <(echo "$2" | tr '\n' ' ')
#    # Sort desired and installed arrays.
#    unset i; while read -r; do desired_s[i++]=$REPLY; done < <(
#      printf "%s\n" "${desired[@]}" | sort
#    )
#    unset i; while read -r; do installed_s[i++]=$REPLY; done < <(
#      printf "%s\n" "${installed[@]}" | sort
#    )
#    # Get the difference. comm is awesome.
#    unset i; while read -r; do remain[i++]=$REPLY; done < <(
#      comm -13 <(printf "%s\n" "${installed_s[@]}") <(printf "%s\n" "${desired_s[@]}")
#  )
#  [[ "$debug" ]] && for v in desired desired_s installed installed_s remain; do
#    echo "$v ($(eval echo "\${#$v[*]}")) $(eval echo "\${$v[*]}")"
#  done
#  echo "${remain[@]}"
#}
