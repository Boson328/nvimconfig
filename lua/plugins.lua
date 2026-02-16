-- lazy.nvim 形式のプラグイン設定
return {
	-- LSP 設定用プラグイン
	{ "neovim/nvim-lspconfig" },

	-- Treesitter プラグイン
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- アイコン表示用プラグイン
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	-- テーマ
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				integrations = {
					snacks = true, -- Snacks.nvim のインテグレーション
					telescope = {
						enabled = true,
					},
					native_lsp = {
						enabled = true,
					},
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- mini.icons（より新しいアイコンセット）
	{
		"echasnovski/mini.icons",
		config = function()
			require("mini.icons").setup()
		end,
	},

	-- ステータスバー
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("extensions.lualine")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- oil.nvim（ファイラー）
	{
		"stevearc/oil.nvim",
		config = function()
			require("extensions.oil")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- vim-pasta（ペースト改善）
	{ "sickill/vim-pasta" },

	-- mini.pairs（自動括弧閉じ）
	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
	},

	-- snacks.nvim
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("extensions.snacks")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>k",
				function()
					require("conform").format({ lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- 必要な言語を追加
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	-- blink.cmp (nvim-cmp の代わり)
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				ghost_text = {
					enabled = true,
				},
				menu = {
					border = "rounded",
				},
				documentation = {
					window = {
						border = "rounded",
					},
				},
			},
		},
	},

	{
		"folke/flash.nvim",
		config = function()
			require("extensions.flash")
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("extensions.noice")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
