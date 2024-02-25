return {
	"kawre/leetcode.nvim",
	event = "VeryLazy",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
	opts = {

		-- configuration goes here
		arg = "leetcode.nvim",
		lang = "rust",
		injector = {
			["golang"] = {
				before = { "package main", "" },
			},
		},
	},
}
