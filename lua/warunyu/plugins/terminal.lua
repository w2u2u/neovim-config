return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			float_opts = {
				border = "curved",
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
		})

		function LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>g",
			"<cmd>lua LAZYGIT_TOGGLE()<CR>",
			{ desc = "Lazygit", noremap = true, silent = true }
		)

		vim.keymap.set({ "n", "t" }, "<leader>i", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating Terminal" })
	end,
}
