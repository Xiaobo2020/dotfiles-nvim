local G = require("G")
local M = {}

M.config = function()
end

M.setup = function()
  G.cmd([[ colorscheme everforest ]])

  -- G.cmd([[
  --   hi Normal ctermfg=7 ctermbg=NONE cterm=NONE
  --   colorscheme everforest
  --   let &t_SI .= '\e[5 q'
  --   let &t_EI .= '\e[1 q'
  --   let &t_vb = ''
  --   let &t_ut = ''
  -- ]])
end

return M