return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			-- パーサーのインストール
			require("nvim-treesitter").install({ "c", "wgsl", "rust" })

			-- ハイライトの有効化(新方式ではFileTypeで手動起動)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "c", "wgsl", "rust" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
