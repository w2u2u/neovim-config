return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		vim.keymap.set({ "n", "t" }, "<C-I>", "<cmd>ToggleTerm direction=float<CR>")

		require("toggleterm").setup({
			float_opts = {
				border = "curved",
			},
		})
	end,
}
