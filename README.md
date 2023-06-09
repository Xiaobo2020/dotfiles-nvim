## Screenshot

Nightfox - nordfox
![Screenshot - Nightfox](./images/Screenshot_LazyVim_Nightfox.png)

Everforest
![Screenshot - Everforest](./images/Screenshot_LazyVim_Everforest.png)

Catppuccin - mocha
![Screenshot - Catppuccin](./images/Screenshot_LazyVim_Catppuccin.png)

## Terminal - iTerm2

### Install

[Homebrew](https://brew.sh) is recommended.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install **iterm2** with homebrew

```bash
brew install --cask iterm2
```

### Shell - Fish

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

Make sure command `brew --version` is ready in fish shell. If `brew` is not found in fish shell, we can add it to the path of fish with below command:

```
fish_add_path /opt/homebrew/bin
```

If your fish shell is ready, then install [fisher](https://github.com/jorgebucaran/fisher), the packages manager in fish:

```bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

### Node Environment - NVM

Once fisher is ready, then install `nvm` to manage your node version:

```bash
fisher install jorgebucaran/nvm.fish
```

Of course, we can set default node version and default packages.
Here I use `v14.16.0` as my default node version.
And these packages below are **ALL** needed in my nvim config.

```bash
set --universal nvm_default_version v14.16.0
set --universal nvm_default_packages nrm open@8.4.2 neovim typescript typescript-language-server @tailwindcss/language-server eslint_d vscode-langservers-extracted sql-language-server
```

or write the packages to the `~/.nvm/default-packages`

```
@tailwindcss/language-server
eslint_d
neovim
nrm
open@8.4.2
typescript-language-server
typescript
vscode-langservers-extracted
sql-language-server
```

### Shell Theme - Tide

You can also install [tide](https://github.com/IlanCosman/tide/tree/447945d2cff8f70d5c791dd4eec8b322d37798dd) to custom your theme of shell.

```bash
fisher install IlanCosman/tide@v5

tide configure
```

### Terminal Font

```bash
brew tap homebrew/cask-fonts

# Search your favourite font
brew search font- | grep jetbrains
# -> font-jetbrains-mono
# -> font-jetbrains-mono-nerd-font

# Install your favourite font
brew install --cask font-jetbrains-mono-nerd-font
```

Then your can set your text font in iterm2

`<Command>` + `,` > `Profiles` > `Text` > `Font` > Select `JetBrainsMono Nerd Font`

### Terminal Theme

#### Nightfox

1. Download source of colorscheme from [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)
2. Import target color preset: `/nightfox.nvim/extra/*/nightfox_iterm.itermcolors`.

![Screenshot - Nightfox](./images/Screenshot_LazyVim_Nightfox.png)

#### Everforest

1. Download source of colorscheme from [Gogh](https://github.com/Gogh-Co/Gogh)
2. Install `Everforest Dark`
3. Open iTerm2 preferences by `<Command>,`
4. Set `Profiles` > `Colors` > `Color Presets` with `Everforest Dark`

![Screenshot - Everforest](./images/Screenshot_LazyVim_Everforest.png)

#### Catppuccin

1. Download source of colorscheme from [Catppuccin Iterm](https://github.com/catppuccin/iterm)
2. Import color presets.

![Screenshot - Catppuccin](./images/Screenshot_LazyVim_Catppuccin.png)

## Neovim

Install `neovim` by brew and some dependencies used later

```bash
brew install neovim ripgrep fd lazygit TheZoraiz/ascii-image-converter/ascii-image-converter
```

Alias `vim` to `nvim` by setting in fish

```bash
echo "alias vim nvim" > ~/.config/fish/aliases.fish
```

Then write `. ~/.config/fish/aliases.fish` to the top of `~/.config/fish/config.fish` and restart your terminal again. Now your can use `vim` directly.

Download this project:

```bash
git clone https://github.com/Xiaobo2020/dotfiles-nvim.git ~/.config/nvim
```

Install [Packer.nvim](https://github.com/wbthomason/packer.nvim)

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Give execute permission for `~/.config/nvim/startup.sh` and then execute it

```bash
cd ~/.config/nvim
chmod +x startup.sh
./startup.sh
```

## Keymaps

**LazyVim** uses [which-key.nvim](https://github.com/folke/which-key.nvim) to help you remember your
keymaps. Just press any key like `<space>` and you'll see a popup with all
possible keymaps starting with `<space>`.

![image](https://user-images.githubusercontent.com/292349/211862473-1ff5ee7a-3bb9-4782-a9f6-014f0e5d4474.png)

<!-- keymaps:start -->

## General

| Key                                               | Description                           | Mode                       |
| ------------------------------------------------- | ------------------------------------- | -------------------------- |
| <code>&lt;C-a&gt;</code>                          | Select all                            | **n**                      |
| <code>&lt;C-h&gt;</code>                          | Go to left window                     | **n**                      |
| <code>&lt;C-j&gt;</code>                          | Go to lower window                    | **n**                      |
| <code>&lt;C-k&gt;</code>                          | Go to upper window                    | **n**                      |
| <code>&lt;C-l&gt;</code>                          | Go to right window                    | **n**                      |
| <code>&lt;C-Up&gt;</code>                         | Increase window height                | **n**                      |
| <code>&lt;C-Down&gt;</code>                       | Decrease window height                | **n**                      |
| <code>&lt;C-Left&gt;</code>                       | Decrease window width                 | **n**                      |
| <code>&lt;C-Right&gt;</code>                      | Increase window width                 | **n**                      |
| <code>&lt;A-j&gt;</code>                          | Move down                             | **n**, **i**, **v**        |
| <code>&lt;A-k&gt;</code>                          | Move up                               | **n**, **i**, **v**        |
| <code>&lt;S-h&gt;</code>                          | Prev buffer                           | **n**                      |
| <code>&lt;S-l&gt;</code>                          | Next buffer                           | **n**                      |
| <code>[b</code>                                   | Prev buffer                           | **n**                      |
| <code>]b</code>                                   | Next buffer                           | **n**                      |
| <code>&lt;leader&gt;bb</code>                     | Switch to Other Buffer                | **n**                      |
| <code>&lt;leader&gt;`</code>                      | Switch to Other Buffer                | **n**                      |
| <code>&lt;esc&gt;</code>                          | Escape and clear hlsearch             | **i**, **n**               |
| <code>&lt;leader&gt;ur</code>                     | Redraw / clear hlsearch / diff update | **n**                      |
| <code>gw</code>                                   | Search word under cursor              | **n**, **x**               |
| <code>n</code>                                    | Next search result                    | **n**, **x**, **o**        |
| <code>N</code>                                    | Prev search result                    | **n**, **x**, **o**        |
| <code>&lt;C-s&gt;</code>                          | Save file                             | **i**, **v**, **n**, **s** |
| <code>&lt;leader&gt;l</code>                      | Lazy                                  | **n**                      |
| <code>&lt;leader&gt;fn</code>                     | New File                              | **n**                      |
| <code>&lt;leader&gt;xl</code>                     | Location List                         | **n**                      |
| <code>&lt;leader&gt;xq</code>                     | Quickfix List                         | **n**                      |
| <code>&lt;leader&gt;uf</code>                     | Toggle format on Save                 | **n**                      |
| <code>&lt;leader&gt;us</code>                     | Toggle Spelling                       | **n**                      |
| <code>&lt;leader&gt;uw</code>                     | Toggle Word Wrap                      | **n**                      |
| <code>&lt;leader&gt;ul</code>                     | Toggle Line Numbers                   | **n**                      |
| <code>&lt;leader&gt;ud</code>                     | Toggle Diagnostics                    | **n**                      |
| <code>&lt;leader&gt;uc</code>                     | Toggle Conceal                        | **n**                      |
| <code>&lt;leader&gt;gg</code>                     | Lazygit (root dir)                    | **n**                      |
| <code>&lt;leader&gt;gG</code>                     | Lazygit (cwd)                         | **n**                      |
| <code>&lt;leader&gt;qq</code>                     | Quit all                              | **n**                      |
| <code>&lt;leader&gt;ui</code>                     | Inspect Pos                           | **n**                      |
| <code>&lt;leader&gt;ft</code>                     | Terminal (root dir)                   | **n**                      |
| <code>&lt;leader&gt;fT</code>                     | Terminal (cwd)                        | **n**                      |
| <code>&lt;esc&gt;&lt;esc&gt;</code>               | Enter Normal Mode                     | **t**                      |
| <code>&lt;leader&gt;ww</code>                     | Other window                          | **n**                      |
| <code>&lt;leader&gt;wd</code>                     | Delete window                         | **n**                      |
| <code>&lt;leader&gt;w-</code>                     | Split window below                    | **n**                      |
| <code>&lt;leader&gt;w&vert;</code>                | Split window right                    | **n**                      |
| <code>&lt;leader&gt;-</code>                      | Split window below                    | **n**                      |
| <code>&lt;leader&gt;&vert;</code>                 | Split window right                    | **n**                      |
| <code>&lt;leader&gt;&lt;tab&gt;l</code>           | Last Tab                              | **n**                      |
| <code>&lt;leader&gt;&lt;tab&gt;f</code>           | First Tab                             | **n**                      |
| <code>&lt;leader&gt;&lt;tab&gt;&lt;tab&gt;</code> | New Tab                               | **n**                      |
| <code>&lt;leader&gt;&lt;tab&gt;]</code>           | Next Tab                              | **n**                      |
| <code>&lt;leader&gt;&lt;tab&gt;d</code>           | Close Tab                             | **n**                      |
| <code>&lt;leader&gt;&lt;tab&gt;[</code>           | Previous Tab                          | **n**                      |

## LSP

| Key                           | Description          | Mode         |
| ----------------------------- | -------------------- | ------------ |
| <code>&lt;leader&gt;cd</code> | Line Diagnostics     | **n**        |
| <code>&lt;leader&gt;cl</code> | Lsp Info             | **n**        |
| <code>gh</code>               | LSP Finder           | **n**        |
| <code>gd</code>               | Goto Definition      | **n**        |
| <code>gr</code>               | References           | **n**        |
| <code>gD</code>               | Goto Declaration     | **n**        |
| <code>gI</code>               | Goto Implementation  | **n**        |
| <code>gt</code>               | Goto Type Definition | **n**        |
| <code>K</code>                | Hover                | **n**        |
| <code>gK</code>               | Signature Help       | **n**        |
| <code>&lt;c-k&gt;</code>      | Signature Help       | **i**        |
| <code>]d</code>               | Next Diagnostic      | **n**        |
| <code>[d</code>               | Prev Diagnostic      | **n**        |
| <code>]e</code>               | Next Error           | **n**        |
| <code>[e</code>               | Prev Error           | **n**        |
| <code>]w</code>               | Next Warning         | **n**        |
| <code>[w</code>               | Prev Warning         | **n**        |
| <code>&lt;leader&gt;cf</code> | Format Document      | **n**        |
| <code>&lt;leader&gt;cf</code> | Format Range         | **v**        |
| <code>&lt;leader&gt;ca</code> | Code Action          | **n**, **v** |
| <code>&lt;leader&gt;cA</code> | Source Action        | **n**        |
| <code>&lt;leader&gt;cr</code> | Rename               | **n**        |

## [bufferline.nvim](https://github.com/akinsho/bufferline.nvim.git)

| Key                           | Description               | Mode  |
| ----------------------------- | ------------------------- | ----- |
| <code>&lt;leader&gt;bp</code> | Toggle pin                | **n** |
| <code>&lt;leader&gt;bP</code> | Delete non-pinned buffers | **n** |

## [flit.nvim](https://github.com/ggandor/flit.nvim.git)

| Key            | Description | Mode                |
| -------------- | ----------- | ------------------- |
| <code>f</code> | f           | **n**, **x**, **o** |
| <code>F</code> | F           | **n**, **x**, **o** |
| <code>t</code> | t           | **n**, **x**, **o** |
| <code>T</code> | T           | **n**, **x**, **o** |

## [leap.nvim](https://github.com/ggandor/leap.nvim.git)

| Key             | Description       | Mode                |
| --------------- | ----------------- | ------------------- |
| <code>s</code>  | Leap forward to   | **n**, **x**, **o** |
| <code>S</code>  | Leap backward to  | **n**, **x**, **o** |
| <code>gs</code> | Leap from windows | **n**, **x**, **o** |

## [mason.nvim](https://github.com/williamboman/mason.nvim.git)

| Key                           | Description | Mode  |
| ----------------------------- | ----------- | ----- |
| <code>&lt;leader&gt;cm</code> | Mason       | **n** |

## [mini.bufremove](https://github.com/echasnovski/mini.bufremove.git)

| Key                           | Description           | Mode  |
| ----------------------------- | --------------------- | ----- |
| <code>&lt;leader&gt;bd</code> | Delete Buffer         | **n** |
| <code>&lt;leader&gt;bD</code> | Delete Buffer (Force) | **n** |

## [mini.surround](https://github.com/echasnovski/mini.surround.git)

| Key              | Description                          | Mode         |
| ---------------- | ------------------------------------ | ------------ |
| <code>gza</code> | Add surrounding                      | **n**, **v** |
| <code>gzd</code> | Delete surrounding                   | **n**        |
| <code>gzf</code> | Find right surrounding               | **n**        |
| <code>gzF</code> | Find left surrounding                | **n**        |
| <code>gzh</code> | Highlight surrounding                | **n**        |
| <code>gzr</code> | Replace surrounding                  | **n**        |
| <code>gzn</code> | Update `MiniSurround.config.n_lines` | **n**        |

## [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim.git)

| Key                           | Description                 | Mode  |
| ----------------------------- | --------------------------- | ----- |
| <code>&lt;leader&gt;fe</code> | Explorer NeoTree (root dir) | **n** |
| <code>&lt;leader&gt;fE</code> | Explorer NeoTree (cwd)      | **n** |
| <code>&lt;leader&gt;e</code>  | Explorer NeoTree (root dir) | **n** |
| <code>&lt;leader&gt;E</code>  | Explorer NeoTree (cwd)      | **n** |

## [noice.nvim](https://github.com/folke/noice.nvim.git)

| Key                            | Description        | Mode                |
| ------------------------------ | ------------------ | ------------------- |
| <code>&lt;S-Enter&gt;</code>   | Redirect Cmdline   | **c**               |
| <code>&lt;leader&gt;snl</code> | Noice Last Message | **n**               |
| <code>&lt;leader&gt;snh</code> | Noice History      | **n**               |
| <code>&lt;leader&gt;sna</code> | Noice All          | **n**               |
| <code>&lt;c-f&gt;</code>       | Scroll forward     | **i**, **n**, **s** |
| <code>&lt;c-b&gt;</code>       | Scroll backward    | **i**, **n**, **s** |

## [nvim-notify](https://github.com/rcarriga/nvim-notify.git)

| Key                           | Description              | Mode  |
| ----------------------------- | ------------------------ | ----- |
| <code>&lt;leader&gt;un</code> | Delete all Notifications | **n** |

## [nvim-spectre](https://github.com/windwp/nvim-spectre.git)

| Key                           | Description                | Mode  |
| ----------------------------- | -------------------------- | ----- |
| <code>&lt;leader&gt;sr</code> | Replace in files (Spectre) | **n** |

## [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)

| Key                          | Description         | Mode  |
| ---------------------------- | ------------------- | ----- |
| <code>&lt;c-space&gt;</code> | Increment selection | **n** |
| <code>&lt;bs&gt;</code>      | Decrement selection | **x** |

## [persistence.nvim](https://github.com/folke/persistence.nvim.git)

| Key                           | Description                | Mode  |
| ----------------------------- | -------------------------- | ----- |
| <code>&lt;leader&gt;qs</code> | Restore Session            | **n** |
| <code>&lt;leader&gt;ql</code> | Restore Last Session       | **n** |
| <code>&lt;leader&gt;qd</code> | Don't Save Current Session | **n** |

## [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)

| Key                                      | Description              | Mode  |
| ---------------------------------------- | ------------------------ | ----- |
| <code>&lt;leader&gt;,</code>             | Switch Buffer            | **n** |
| <code>&lt;leader&gt;/</code>             | Find in Files (Grep)     | **n** |
| <code>&lt;leader&gt;:</code>             | Command History          | **n** |
| <code>&lt;leader&gt;&lt;space&gt;</code> | Find Files (root dir)    | **n** |
| <code>&lt;leader&gt;fb</code>            | Buffers                  | **n** |
| <code>&lt;leader&gt;ff</code>            | Find Files (root dir)    | **n** |
| <code>&lt;leader&gt;fF</code>            | Find Files (cwd)         | **n** |
| <code>&lt;leader&gt;fr</code>            | Recent                   | **n** |
| <code>&lt;leader&gt;gc</code>            | commits                  | **n** |
| <code>&lt;leader&gt;gs</code>            | status                   | **n** |
| <code>&lt;leader&gt;sa</code>            | Auto Commands            | **n** |
| <code>&lt;leader&gt;sb</code>            | Buffer                   | **n** |
| <code>&lt;leader&gt;sc</code>            | Command History          | **n** |
| <code>&lt;leader&gt;sC</code>            | Commands                 | **n** |
| <code>&lt;leader&gt;sd</code>            | Diagnostics              | **n** |
| <code>&lt;leader&gt;sg</code>            | Grep (root dir)          | **n** |
| <code>&lt;leader&gt;sG</code>            | Grep (cwd)               | **n** |
| <code>&lt;leader&gt;sh</code>            | Help Pages               | **n** |
| <code>&lt;leader&gt;sH</code>            | Search Highlight Groups  | **n** |
| <code>&lt;leader&gt;sk</code>            | Key Maps                 | **n** |
| <code>&lt;leader&gt;sM</code>            | Man Pages                | **n** |
| <code>&lt;leader&gt;sm</code>            | Jump to Mark             | **n** |
| <code>&lt;leader&gt;so</code>            | Options                  | **n** |
| <code>&lt;leader&gt;sR</code>            | Resume                   | **n** |
| <code>&lt;leader&gt;sw</code>            | Word (root dir)          | **n** |
| <code>&lt;leader&gt;sW</code>            | Word (cwd)               | **n** |
| <code>&lt;leader&gt;uC</code>            | Colorscheme with preview | **n** |
| <code>&lt;leader&gt;ss</code>            | Goto Symbol              | **n** |
| <code>&lt;leader&gt;sS</code>            | Goto Symbol (Workspace)  | **n** |

## [todo-comments.nvim](https://github.com/folke/todo-comments.nvim.git)

| Key                           | Description              | Mode  |
| ----------------------------- | ------------------------ | ----- |
| <code>]t</code>               | Next todo comment        | **n** |
| <code>[t</code>               | Previous todo comment    | **n** |
| <code>&lt;leader&gt;xt</code> | Todo (Trouble)           | **n** |
| <code>&lt;leader&gt;xT</code> | Todo/Fix/Fixme (Trouble) | **n** |
| <code>&lt;leader&gt;st</code> | Todo                     | **n** |

## [trouble.nvim](https://github.com/folke/trouble.nvim.git)

| Key                           | Description                     | Mode  |
| ----------------------------- | ------------------------------- | ----- |
| <code>&lt;leader&gt;xx</code> | Document Diagnostics (Trouble)  | **n** |
| <code>&lt;leader&gt;xX</code> | Workspace Diagnostics (Trouble) | **n** |
| <code>&lt;leader&gt;xL</code> | Location List (Trouble)         | **n** |
| <code>&lt;leader&gt;xQ</code> | Quickfix List (Trouble)         | **n** |
| <code>[q</code>               | Previous trouble/quickfix item  | **n** |
| <code>]q</code>               | Next trouble/quickfix item      | **n** |

## [vim-illuminate](https://github.com/RRethy/vim-illuminate.git)

| Key             | Description    | Mode  |
| --------------- | -------------- | ----- |
| <code>]]</code> | Next Reference | **n** |
| <code>[[</code> | Prev Reference | **n** |

## [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

| Key                           | Description           | Mode  |
| ----------------------------- | --------------------- | ----- |
| <code>&lt;leader&gt;mp</code> | MarkdownPreview start | **n** |
| <code>&lt;leader&gt;ms</code> | MarkdownPreview stop  | **n** |

## [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc)

| Key                            | Description            | Mode  |
| ------------------------------ | ---------------------- | ----- |
| <code>&lt;leader&gt;mth</code> | Generate toc in GitHub | **n** |
| <code>&lt;leader&gt;mtl</code> | Generate toc in GitLab | **n** |
| <code>&lt;leader&gt;mtm</code> | Generate toc in Marked | **n** |

## [vim-floaterm](https://github.com/voldikss/vim-floaterm)

| Key                      | Description           | Mode  |
| ------------------------ | --------------------- | ----- |
| <code>&lt;C-t&gt;</code> | Float terminal toggle | **n** |
| <code>&lt;C-t&gt;</code> | Float terminal toggle | **t** |

<!-- keymaps:end -->
