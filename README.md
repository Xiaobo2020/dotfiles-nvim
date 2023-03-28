## Screenshot

![Screenshot](./images/Screenshot1.png)

## Fish shell

Install [ fish ](https://github.com/fish-shell/fish-shell) shell

```bash
brew install fish
```

Check your path of fish:
```bash
which fish
# e.g. -> /opt/homebrew/bin/fish
```

Set fish as your default shell in terminal with your path of fish:
```bash
chsh -s /opt/homebrew/bin/fish
```

If fish is not configed in your shell bin, just add it in:
```bash
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells 
```

Then, restart your terminal.

If your fish shell is ready, then install [fisher](https://github.com/jorgebucaran/fisher), the packages manager in fish:
```bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

Once fisher is ready, then install `nvm` to manage your node version:
```bash
fisher install jorgebucaran/nvm.fish
```

Of course, we can set default node version  and default packages.
Here I use `v16.19.0` as my default node version.
And these packages below are **ALL** needed in my nvim config.
```bash
set --universal nvm_default_version v16.19.0
set --universal nvm_default_packages nrm open@8.4.2 neovim typescript typescript-language-server @tailwindcss/language-server eslint prettier vscode-langservers-extracted
```

## iTerm2 theme

1. Download source of colorscheme from [Gogh](https://github.com/Gogh-Co/Gogh)
2. Install `Everforest Dark`
3. Open iTerm2 preferences by `<Command>,`
4. Set `Profiles` > `Colors` > `Color Presets` with `Everforest Dark`

## Neovim

Install `neovim` by brew
```bash
brew install neovim
```

Alias `vim` to `nvim` by setting in fish
```bash
echo "alias vim nvim" > ~/.config/fish/aliases.fish
```

Then write `. ~/.config/fish/aliases.fish` to the top of `~/.config/fish/config.fish` and restart your termianal again. Now your can use `vim` directly.

Download this project:
```bash
git clone https://github.com/Xiaobo2020/dotfiles-nvim.git ~/.config/nvim
```

Install [Packer.nvim](https://github.com/wbthomason/packer.nvim)
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Open `~/.config/nvim/init.lua` by `vim` and run `:PackerInstall`
```bash
vim ~/.config/nvim/init.lua
```

Fix error caused by highlights.scm of treesitter
```bash
cd ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/queries/vim/
mv highlights.scm highlights.scm.bak
```
