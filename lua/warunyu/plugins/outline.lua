return {
	"hedyhli/outline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

		require("outline").setup({
			outline_window = {
				auto_close = true,
				auto_jump = true,
			},
			outline_items = {
				show_symbol_lineno = true,
			},
		})
	end,
}
