-- Show intro page if no file opened
if (next(vim.fn.argv()) ~= nil) == false then
	vim.cmd(":intro")
end
