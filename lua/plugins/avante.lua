return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>h", "<cmd>CopilotChat<CR>", mode = { "n" }, desc = "Copilotを開く" },
		},
		opts = {
			window = {
				layout = "float", -- 'vertical', 'horizontal', 'float'
				width = 0.8, -- 画面の40%
				height = 0.8, -- 画面の50%（floatの場合）
				border = "rounded",
			},
		},
	},
}
