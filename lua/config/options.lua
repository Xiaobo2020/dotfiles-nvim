-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.showcmd = true
vim.opt.encoding = "utf-8"
vim.opt.wildmenu = true
vim.opt.pumheight = 10
vim.opt.conceallevel = 0
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.inccommand = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 400
vim.opt.backspace = "indent,eol,start"
vim.opt.whichwrap = "b,s,<,>,h,"
vim.opt.mouse = "a"
vim.opt.vb = true
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/cache/undodir"
vim.opt.viminfo = "!,'10000,<50,s10,h"

-- vim.opt.foldenable = true
-- vim.opt.foldmethod = "manual"

vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.MagicFoldText()"
vim.opt.viewdir = os.getenv("HOME") .. "/.config/nvim/cache/viewdir"

vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.shortmess = "filnxtToOScIF"
vim.opt.scrolloff = 5
vim.opt.showmode = false
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.cul = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars = "fold:-,stlnc:#,eob: ,foldsep:="
vim.opt.termguicolors = true

function MagicFoldText()
  local spacetext = ("        "):sub(0, vim.opt.shiftwidth:get())
  local line = vim.fn.getline(vim.v.foldstart):gsub("\t", spacetext)
  local folded = vim.v.foldend - vim.v.foldstart + 1
  local findresult = line:find("%S")
  if not findresult then
    return "+ folded " .. folded .. " lines "
  end
  local empty = findresult - 1
  local funcs = {
    [0] = function(_)
      return "" .. line
    end,
    [1] = function(_)
      return "+" .. line:sub(2)
    end,
    [2] = function(_)
      return "+ " .. line:sub(3)
    end,
    [-1] = function(c)
      local result = " " .. line:sub(c + 1)
      local foldednumlen = #tostring(folded)
      for _ = 1, c - 2 - foldednumlen do
        result = "-" .. result
      end
      return "+" .. folded .. result
    end,
  }
  return funcs[empty <= 2 and empty or -1](empty) .. " folded " .. folded .. " lines "
end
