-- lazy.nvim のブートストラップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 基本オプションの設定
require("options")

-- キーマップの設定
require("keymaps")

-- 自動コマンドの設定
require("autocmds")

-- プラグインの設定（lazy.nvim で読み込み）
require("lazy").setup("plugins")

-- 各種セットアップ
require("setup.treesitter")
require("setup.lspconfig")
