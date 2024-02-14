## Establishing symlinks to use /.config/dotfiles as source of truth

1. Make sure to clone dotfiles to ~/.config/
2. Create Symlinks:

- `mkdir ~/.config/skhd ~/.config/yabai`
- `ln -s ~/.dotfiles/wezterm.lua ~/.wezterm.lua`
- `ln -s ~/.dotfiles/zshrc ~/.zshrc`
- `ln -s ~/.dotfiles/yabairc ~/.config/yabai/yabairc`
- `ln -s ~/.dotfiles/skhdrc ~/.config/skhd/skhdrc`
