local G = require("G")
local M = {}

M.config = function()
  G.g.surround_no_mappings = 1
  local opts = {silent = true, noremap = true}
  G.map({
    -- Just the defaults copied here.
    {"n", "ds", "<Plug>Dsurround", opts},
    {"n", "cs", "<Plug>Csurround", opts},
    {"n", "cS", "<Plug>CSurround", opts},
    {"n", "ys", "<Plug>Ysurround", opts},
    {"n", "yS", "<Plug>YSurround", opts},
    {"n", "yss", "<Plug>Yssurround", opts},
    {"n", "ySs", "<Plug>YSsurround", opts},
    {"n", "ySS", "<Plug>YSsurround", opts},

    -- The conflicting ones. Note that `<Plug>(leap-cross-window)`
    -- _does_ work in Visual mode, if jumping to the same buffer,
    -- so in theory, `gs` could be useful for Leap too...
    {"x", "gs", "<Plug>VSurround", opts},
    {"x", "gS", "<Plug>VgSurround", opts},
  })
end

M.setup = function()
end

return M