-- ~/.config/nvim/lua/plugins.lua
return {
	-- LSP + Autocompletion
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim", config = true },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },

	-- Emmet
	{ "mattn/emmet-vim" },

	-- Autotag (auto close + rename HTML tags)
	{ "windwp/nvim-ts-autotag" },

	-- Treesitter (for syntax + autotag)
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"mattn/emmet-vim",
		init = function()
			-- Enable Emmet in insert, normal, and visual modes
			vim.g.user_emmet_mode = "inv"

			-- Use Ctrl+E to expand abbreviations
			vim.g.user_emmet_expandabbr_key = "<C-e>"

			-- Optional: keep original leader in case you want both
			-- vim.g.user_emmet_leader_key = '<C-y>'
		end,
	},
}
