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
				telescope = {
					enabled = true,
				},
				native_lsp = {
					enabled = true,
				},
			},
		},
	},
}
