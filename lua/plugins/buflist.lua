return {
	"gongitsune/buflist.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = {},
	keys = {
		{
			"<leader>t",
			function()
				require("buflist").open()
			end,
			mode = { "n" },
			{ desc = "バッファー" },
		},
	},
}
