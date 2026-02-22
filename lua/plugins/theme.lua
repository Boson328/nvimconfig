return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,

		opts = {
			-- transparent_background = true,
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			integrations = {
				snacks = true, -- Snacks.nvim のインテグレーション
				native_lsp = {
					enabled = true,
				},
			},
			highlight_overrides = {
				all = function(colors)
					return {
						FloatBorder = { bg = colors.none },
						NormalFloat = { bg = colors.none },
						FloatTitle = { bg = colors.none },
					}
				end,
			},
		},
	},
}
