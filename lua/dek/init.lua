require("dek.remap")
--vim.wo.number = true

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.swapfile = false

local f = io.open("debug-conf/dir", "r")
local conf_dir = f:read()
f:close()

f = io.open("debug-conf/program", "r")
local conf_program = f:read()
f:close()

print(conf_dir .. '/' .. conf_program)

