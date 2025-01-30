-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<A-Down>", "ddp", { desc = "Move current line down" })
vim.keymap.set("n", "<A-Up>", "ddkP", { desc = "Move current line up" })
vim.keymap.set("x", "<A-S-Down>", ":co '><CR>gv=gv", { desc = "Duplicate and re-indent selected text below" })
vim.keymap.set("x", "<A-S-Up>", ":co '<-1<CR>gv=gv", { desc = "Duplicate selected text above" })

