return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						desc = " Explorer",
						group = "Special",
						action = "NvimTreeToggle",
						key = "e",
					},
					{
						desc = " Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = "󰊳 Lazy",
						group = "@property",
						action = "Lazy",
						key = "z",
					},
					{
						desc = " Mason",
						group = "Number",
						action = "Mason",
						key = "m",
					},
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
