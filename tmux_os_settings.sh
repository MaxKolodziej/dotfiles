#!/bin/zsh

function os {
  case "$(uname -s)" in

   Darwin)
     echo 'OSX'
     ;;

   Linux)
     echo 'Linux'
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'MS Windows'
     ;;

   *)
     echo 'Other OS'
     ;;
 esac
}

verify_os () {
  myos=$(os)
  if [[ $myos == "Linux" ]]
  then
    tmux set -g @thumbs-command "echo {} | tr -d '[:cntrl:]' | xclip -selection clipboard"
  else
    tmux set -g @thumbs-command "echo {} | tr -d '[:cntrl:]' | pbcopy"
  fi
}

verify_os
