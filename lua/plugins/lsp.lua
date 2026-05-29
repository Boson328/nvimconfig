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
			vim.lsp.config.pyright = {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic", -- 厳しくしたいなら "strict"
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							venvPath = ".", -- .venv がある場所（プロジェクトルート）
							venv = ".venv", -- 仮想環境のディレクトリ名
						},
					},
				},
			}
			vim.lsp.config.ruff_lsp = {}
			vim.lsp.config.ts_ls = {
				settings = {},
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			}
			vim.lsp.config.wgsl_analyzer = {}

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("ruff_lsp")
			vim.lsp.enable("wgsl_analyzer")
		end,
	},
}
