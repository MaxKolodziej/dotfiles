export SHELL=/bin/zsh

PATH="/usr/local/bin:/usr/local/sbin:/Applications/Firefox.app/Contents/MacOS:/Applications/MacVim.app/Contents/MacOS/:$PATH" # if not already present
PATH="$PATH:~/scripts:" # if you want to dump your own bash scripts here
export PATH=$PATH

source ~/.private_profile
source ~/.public_profile

# define the plugins
source ~/antigen.zsh
antigen bundle starcraftman/zsh-git-prompt
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle Peeja/ctrl-zsh
antigen bundle pjg/zsh-vim-plugin
antigen bundle zsh-users/zsh-history-substring-search

# load the plugins
antigen apply

#
#
#
autoload -U colors
colors

SAVEHIST=200
HISTFILE=~/.zsh_history

zmodload zsh/terminfo
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  zle && zle reset-prompt
  return $(( 128 + $1 ))
}

PROMPT='
%(!.%{$fg[red]%}.%{$fg[green]%})%n@%m%{$reset_color%}: %{$fg[blue]%}%~%{$reset_color%} $(git_super_status) %{$fg[white]%}$(~/.rvm/bin/rvm-prompt 2> /dev/null)%{$reset_color%} ${vim_mode}
${smiley} '

RPROMPT='%{$fg[white]%}%T%{$reset_color%}'

# don't display RPROMPT for previously accepted lines; only display it next to current line
setopt transient_rprompt

bindkey -v

update_current_git_vars

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
