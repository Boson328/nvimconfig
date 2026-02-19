return {
	{
		"uga-rosa/ccc.nvim",
		opts = {
			highlighter = {
				-- ハイライトの自動有効化
				auto_enable = true,
				-- ハイライトが有効になるファイルタイプの制限
				filetypes = { "css", "html", "vim", "toml" },
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
