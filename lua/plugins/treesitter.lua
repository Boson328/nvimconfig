return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local install_dir = vim.fn.stdpath("data") .. "/site"
			vim.opt.runtimepath:prepend(install_dir) -- ← 追加

			local status_ok, configs = pcall(require, "nvim-treesitter.configs")
			if not status_ok then
				return
			end

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			configs.setup({
				parser_install_dir = install_dir, -- ← 追加
				ensure_installed = { "c", "wgsl", "rust" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
