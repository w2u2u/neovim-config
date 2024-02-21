return {
	"kdheepak/lazygit.nvim",
	enabled = false,
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>git", "<cmd>LazyGit<cr>", {
			desc = "LazyGit",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "<TAB>", "")
	end,
}
