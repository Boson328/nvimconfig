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

opt.winborder = "single"

opt.fillchars:append({ eob = " " })

if vim.fn.has("wsl") == 1 then
	opt.clipboard = "unnamed"
	-- WSL環境
	vim.g.clipboard = {
		name = "win32yank",
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
elseif vim.fn.has("unix") == 1 then
	opt.clipboard = "unnamedplus"
end

vim.g.mapleader = " "

vim.o.winborder = "rounded"

vim.cmd("filetype plugin indent on")
