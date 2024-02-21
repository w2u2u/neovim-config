return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"andrew-george/telescope-themes",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.5,
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
		telescope.load_extension("themes")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set(
			"n",
			"<leader>fa",
			"<cmd>Telescope find_files hidden=true no_ignore=true<CR>",
			{ desc = "Telescope find ALL files" }
		)
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fo", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Telescope themes" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope commands" })
		vim.keymap.set(
			"n",
			"<leader>fb",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Telescope current buffer fuzzy find" }
		)
	end,
}
