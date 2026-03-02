# Paths
export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH=$HOME/.local/bin:/opt/homebrew/bin:$PATH
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

## Workaround for Claude Code file descriptor leak (github.com/anthropics/claude-code/issues/29573)
ulimit -n 65536

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
alias cdsp='claude --dangerously-skip-permissions'
alias tc='tmux attach -t claude || tmux new -s claude'
alias tb='tmux attach -t buddy || tmux new -s buddy -c /Users/broman/Documents/Programming/TodoTalk "claude --dangerously-skip-permissions /buddy"'

# TODO: figure out wezterm notifications for claude code completion (notify-on, notify-off, notify)

# shell functions (fh, fe, tabn, etc.)
[ -f "$HOME/.dotfiles/zshfunctions" ] && source "$HOME/.dotfiles/zshfunctions"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
