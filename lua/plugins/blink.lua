return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "saghen/blink.compat" },
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	---@module 'blink.cmp'
	---@type blink.cmp.Config
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
			default = { "lsp", "path", "snippets", "buffer", "crates" },
			providers = {
				crates = {
					name = "crates",
					module = "blink.compat.source",
				},
			},
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
		signature = { enabled = false },
	},
}
