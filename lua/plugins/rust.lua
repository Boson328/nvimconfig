return {
	{
		"mrcjkb/rustaceanvim",
		version = "^8",
		lazy = false,
		ft = { "rust" },
		opts = {
			server = {
				on_attach = function(client, bufnr)
					-- キーマップ
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end

					map("n", "<leader>ca", function()
						vim.cmd.RustLsp("codeAction")
					end, "Code Action (Rust)")

					map("n", "K", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, "Hover (Rust)")

					map("n", "<leader>rr", function()
						vim.cmd.RustLsp("runnables")
					end, "Runnables")

					map("n", "<leader>rd", function()
						vim.cmd.RustLsp("debuggables")
					end, "Debuggables")

					map("n", "<leader>re", function()
						vim.cmd.RustLsp("explainError")
					end, "Explain Error")

					map("n", "<leader>rm", function()
						vim.cmd.RustLsp("expandMacro")
					end, "Expand Macro")

					map("n", "<leader>rc", function()
						vim.cmd.RustLsp("openCargo")
					end, "Open Cargo.toml")

					map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
					map("n", "gr", vim.lsp.buf.references, "References")
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
				end,

				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = { enable = true },
						},
						checkOnSave = true,
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
						inlayHints = {
							bindingModeHints = { enable = false },
							chainingHints = { enable = true },
							closingBraceHints = { enable = true, minLines = 25 },
							closureReturnTypeHints = { enable = "never" },
							lifetimeElisionHints = { enable = "never" },
							parameterHints = { enable = true },
							typeHints = { enable = true },
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
		end,
	},
	{
		-- Cargo.toml の依存関係バージョン確認
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			completion = {
				crates = {
					enabled = true, -- blink.cmpと連携
				},
			},
		},
	},
}
