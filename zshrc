# Paths
export PATH=/opt/homebrew/bin:$PATH
export PATH="$PATH:/Applications/Visual Studio 
Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH=${PATH}:/usr/local/mysql/bin
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export EDITOR=nvim
# setting this to ensure undercurl after installing wezterm info
# https://wezfurlong.org/wezterm/faq.html?h=undercurl#how-do-i-enable-undercurl-curly-underlines
export TERM=wezterm
# local helper for TW 'DOCTYPE <' issue on TW frontend locally
# export NODE_COMPILE_CACHE=~/.cache/nodejs-compile-cache

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f .zshenv ] && source .zshenv

## Opts
## vi keybindings in linux shell
set -o vi
setopt autocd
setopt HIST_IGNORE_ALL_DUPS

# will execute jump in zsh
eval "$(jump shell zsh)"

# aliases and functions
alias wezconf='cd ~/.dotfiles && nvim wezterm.lua'
alias ys='yabai --start-service && skhd --start-service'
alias ye='yabai --stop-service && skhd --stop-service'
alias lovey='love .'
alias sql='mysql -u root -p';
alias jts='j thrive/server'
alias jtw='j thrive/web'
alias jte='j thrive/ehr'
alias jtso='j thrive/server && nvim'
alias jtwo='j thrive/web && nvim'
alias jteo='j thrive/ehr && nvim'
alias dcu='docker compose up'
alias dcd='docker compose down'

# repeat command history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fuzzy enter file from $EDITOR
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

