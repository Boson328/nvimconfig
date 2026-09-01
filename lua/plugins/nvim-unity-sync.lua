return {
	"apyra/nvim-unity-sync",
	lazy = false,
	ft = "cs",
	config = function()
		require("unity.plugin").setup({
			-- 必要なら設定を追加(省略可)
			-- unity_path = "path/to/Unity.exe", -- :Uopenコマンド用(任意)
			unity_cs_template = true, -- 新規.csファイルにMonoBehaviourテンプレートを挿入するか
		})
	end,
}
