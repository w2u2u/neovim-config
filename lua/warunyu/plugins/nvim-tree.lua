return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		nvimtree.setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFocus<CR>")
	end,
}
