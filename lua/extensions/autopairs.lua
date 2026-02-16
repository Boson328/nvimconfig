require("nvim-autopairs").setup({
	check_ts = true, -- Treesitter を使用
	ts_config = {
		lua = { "string" }, -- Lua の文字列内では無効
		javascript = { "template_string" },
	},
	fast_wrap = {}, -- Alt+e で高速ラップ
})

-- nvim-cmp との統合
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
