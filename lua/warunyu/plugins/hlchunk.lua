return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	config = function()
		require("hlchunk").setup({
			indent = {
				enable = false,
				use_treesitter = true,
			},
			line_num = {
				use_treesitter = true,
			},
			blank = {
				enable = false,
			},
			context = {
				enable = false,
			},
		})
	end,
}
