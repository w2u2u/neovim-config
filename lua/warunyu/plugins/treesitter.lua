return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = function()
				require("treesitter-context").setup({
					separator = "-",
				})
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			config = function()
				require("nvim-treesitter.configs").setup({
					textobjects = {
						move = {
							enable = true,
							set_jumps = true,

							goto_next_start = {
								["<leader>w"] = {
									query = "@parameter.inner",
									desc = "Go to next parameter",
								},
								["<leader>j"] = {
									query = "@statement.outer",
									desc = "Go to next statement",
								},
							},

							goto_previous_start = {
								["<leader>b"] = {
									query = "@parameter.inner",
									desc = "Go to previous parameter",
								},
								["<leader>k"] = {
									query = "@statement.outer",
									desc = "Go to previous statement",
								},
							},
						},
					},
				})
			end,
		},
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			ensure_installed = {
				"lua",
				"rust",
				"ruby",
				"go",
				"python",
			},
			sync_install = false,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_decremental = "<BS>",
					node_incremental = "<CR>",
					scope_incremental = "false",
				},
			},
		})
	end,
}
