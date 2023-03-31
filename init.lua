require("pack.options")
require("pack.keymaps")
require("pack.plugins")

local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("pack.macos")
end
if is_win then
	require("pack.windows")
end
