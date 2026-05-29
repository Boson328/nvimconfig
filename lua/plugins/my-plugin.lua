-- 自分で作ったプラグイン
return {
	"Boson328/romaji-translate.nvim",
	event = "BufEnter",
	opts = {},
	keys = {
		{ "<leader>x", "<cmd>RomajiTranslate<CR>", desc = "ローマ字変数を翻訳", mode = { "n" } },
	},
}
