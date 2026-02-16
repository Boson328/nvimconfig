local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
