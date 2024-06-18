-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- keybindings
vim.cmd('vmap <C-c> "+y')

-- Comments
vim.api.nvim_set_keymap("n", ",,", "<Plug>(comment_toggle_linewise_current)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ",,", "<Plug>(comment_toggle_linewise_visual)", { noremap = true, silent = true })
