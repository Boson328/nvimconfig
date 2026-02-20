return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>k",
				function()
					require("conform").format({ lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "フォーマット",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- 必要な言語を追加
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
