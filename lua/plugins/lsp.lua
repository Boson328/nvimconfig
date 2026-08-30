local function git_root_or_cwd()
	local buf_dir = vim.fn.expand("%:p:h") -- 現在バッファのディレクトリ
	local result = vim.system({ "git", "rev-parse", "--show-toplevel" }, { text = true, cwd = buf_dir }):wait()
	if result.code == 0 then
		return vim.trim(result.stdout)
	end
	return buf_dir
end

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.lsp.config.clangd = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
				},
				filetypes = { "c", "cpp", "cuda" }, -- cudaを追加
			}
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
			vim.lsp.config.nil_ls = {}
			vim.lsp.config.omnisharp = {
				cmd = { "OmniSharp" },
				filetypes = { "cs" },
				root_dir = function(bufnr, on_dir)
					on_dir(git_root_or_cwd())
				end,
				init_options = {},
				settings = {
					FormattingOptions = {
						EnableEditorConfigSupport = true,
					},
					MsBuild = {
						LoadProjectsOnDemand = true,
					},
					RoslynExtensionsOptions = {
						EnableAnalyzersSupport = true,
					},
				},
			}

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("ruff_lsp")
			vim.lsp.enable("wgsl_analyzer")
			vim.lsp.enable("nil_ls")
			vim.lsp.enable("omnisharp")
		end,
	},
}
