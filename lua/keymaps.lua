local wk = require("which-key")

wk.add({
	{ "<leader>w", "<cmd>w<cr>", desc = "保存する" },
	{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazyを開く" },
	{
		"L",
		function()
			vim.diagnostic.open_float()
		end,
		desc = "ダイアログを開く",
	},
	{
		"<F2>",
		function()
			vim.lsp.buf.rename()
		end,
		desc = "リネーム",
	},
})
