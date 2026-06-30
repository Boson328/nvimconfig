-- lazy.nvim のブートストラップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- 基本オプションの設定
require("options")

-- 自動コマンドの設定
require("autocmds")

-- 各種プラグインのインストール
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
	performance = {
		rtp = {
			disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
	default = {
		lazy = true,
	},
	ui = {
		border = "rounded",
	},
})

vim.cmd.colorscheme("catppuccin")

require("keymaps")
