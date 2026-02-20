return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.lsp.config.clangd = {}
			vim.lsp.config.lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						hint = { enable = true },
					},
				},
			}
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
		end,
	},
}
