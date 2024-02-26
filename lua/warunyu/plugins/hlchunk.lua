return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	config = function()
		local colors_name = vim.g.colors_name
		local color = "#c6a0f6"

		if colors_name == "gruvbox" then
			color = "#fb4934"
		end

		require("hlchunk").setup({
			chunk = {
				enable = true,
				style = { color },
			},
			indent = {
				enable = false,
				use_treesitter = true,
			},
			line_num = {
				use_treesitter = true,
				style = { color },
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
