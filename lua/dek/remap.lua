vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<F6>", vim.cmd.bnext)
vim.keymap.set("n", "<F5>", vim.cmd.bprevious)
vim.keymap.set("n", "<F2>", vim.cmd.write)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>nt", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<leader><Escape>", vim.cmd.bw)
