return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = vim.g.colors_name,
				globalstatus = true,
				section_separators = {
					left = "",
					right = "",
				},
				component_separators = {
					left = "",
					right = "",
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filetype", "filename" },
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = { "encoding" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
