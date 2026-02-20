return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		keys = {
			{
				"<leader>e",
				function()
					if vim.bo.filetype == "oil" then
						return
					end

					require("oil").open_float(
						nil,
						---@type oil.OpenOpts
						{
							preview = {
								vertical = true,
							},
							max_width = math.floor(vim.o.columns * 0.8),
							max_height = math.floor(vim.o.lines * 0.8),
						}
					)
				end,
				desc = "Oilを開く",
			},
		},
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			skip_confirm_for_simple_edits = true,

			keymaps = {
				["q"] = "actions.close",
				["H"] = "actions.parent",
				["<CR>"] = "actions.select",
			},
			use_default_keymaps = false,
			view_options = {
				show_hidden = true,
			},
			float = {
				preview_split = "right",
				max_width = math.floor(vim.o.columns * 0.8),
				max_height = math.floor(vim.o.lines * 0.8),
			},
			default_file_explorer = true,
			win_options = {
				number = true,
				relativenumber = true,
			},
		},
	},
}
