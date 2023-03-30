require("xiaobo2020.options")
require("xiaobo2020.colorscheme")
require("xiaobo2020.keymaps")
require("xiaobo2020.plugins")

local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("xiaobo2020.macos")
end
if is_win then
	require("xiaobo2020.windows")
end
