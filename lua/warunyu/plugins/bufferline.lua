return {
	"akinsho/bufferline.nvim",
	enabled = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				-- separator_style = "slant",
			},
		})
	end,
}
