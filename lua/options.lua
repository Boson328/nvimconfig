local opt = vim.opt

-- 行番号の表示
opt.number = true
opt.relativenumber = true

-- タブとインデントの設定
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- 検索設定
opt.ignorecase = true
opt.smartcase = true

opt.clipboard = "unnamed"

opt.winborder = "single"

vim.g.clipboard = {
	name = "myClipboard",
	copy = {
		["+"] = "win32yank.exe -i",
		["*"] = "win32yank.exe -i",
	},
	paste = {
		["+"] = "win32yank.exe -o",
		["*"] = "win32yank.exe -o",
	},
	cache_enabled = 1,
}

vim.g.mapleader = " "

vim.o.winborder = "rounded"

vim.cmd("filetype plugin indent on")
