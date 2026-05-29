local wk = require("which-key")

wk.add({
	{ "<leader>w", "<cmd>w<cr>", desc = "保存する" },
	{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazyを開く" },
	{
		"<leader>i",
		function()
			vim.lsp.buf.code_action()
		end,
		desc = "コードアクション",
	},
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
	{
		"<leader>rl",
		function()
			local line = vim.api.nvim_get_current_line()
			local row = vim.api.nvim_win_get_cursor(0)[1] - 1

			if line:match("%s*let%s+mut%s+") then
				vim.notify("すでに let mut です", vim.log.levels.INFO)
				return
			end

			local new_line = line:gsub("(%s*let%s+)", "%1mut ", 1)

			if new_line ~= line then
				vim.api.nvim_buf_set_lines(0, row, row + 1, false, { new_line })
			else
				vim.notify("この行に let が見つかりません", vim.log.levels.WARN)
			end
		end,
		desc = "let -> let mut",
		mode = { "n" },
	},
})
