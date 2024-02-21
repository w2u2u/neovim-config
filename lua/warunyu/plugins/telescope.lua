return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = {
						preview_cutoff = 0,
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fo", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>th", builtin.colorscheme, { desc = "Telescope colorscheme" })
	end,
}
