return {
	{
		"echasnovski/mini.icons",
		init = function()
			-- lualineより前に読み込む
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
}
