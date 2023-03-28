## Fish shell

```bash
# Install fish shell from https://github.com/fish-shell/fish-shell
brew install fish

# Check your path of fish and then config fish shell
which fish # -> /opt/homebrew/bin/fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells 
chsh -s /opt/homebrew/bin/fish

# Set vim alias to nvim in fish shell
echo "alias vim nvim" > ~/.config/fish/aliases.fish
# Import aliases.fish on the top of `~/.config/fish/config.fish`
# ". ~/.config/fish/aliases.fish"

# Restart your terminal

# Install fisher from https://github.com/jorgebucaran/fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install nvm by fisher
fisher install jorgebucaran/nvm.fish

# Config nvm
nvm install v16.19.0
nvm use v16.19.0

# Set default configs for nvm
set --universal nvm_default_version v16.19.0
set --universal nvm_default_packages nrm open@8.4.2 neovim typescript typescript-language-server @tailwindcss/language-server eslint prettier vscode-langservers-extracted
```

## iTerm2 theme

1. Download source of colorscheme from [Gogh](https://github.com/Gogh-Co/Gogh)
2. Install `Everforest Dark`
3. Open iTerm2 preferences by `<Command>,`
4. Set `Profiles` > `Colors` > `Color Presets` with `Everforest Dark`

## Neovim

```bash
# Install Neovim and luajit
brew install neovim luajit

# Download this project
git clone https://github.com/Xiaobo2020/dotfiles-nvim.git ~/.config/nvim

# Install Packer.nvim from https://github.com/wbthomason/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# run :PackerInstall
vim ~/.config/nvim/init.lua

# Fix colorsheme error if exists
```

