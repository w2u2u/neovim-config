return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		local working_dir = string.match(vim.fn.getcwd(), "%S(%w+)$")

		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal,
				themable = true,
				indicator = {
					-- icon = " ",
					-- style = "underline",
				},
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = ""
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")

						if s == "" then
							s = s .. sym .. n
						else
							s = s .. " " .. sym .. n
						end
					end
					return "[" .. s .. "]"
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "󰄛  ~/.../" .. working_dir .. "  ",
						text_align = "center",
						separator = true,
					},
				},
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
			highlights = {
				buffer_selected = {
					fg = "#1ABC9C",
					bold = false,
					italic = true,
				},
				hint_diagnostic_selected = {
					fg = "#FFFFFF",
					bold = false,
					italic = true,
				},
				info_diagnostic_selected = {
					fg = "#3498DB",
					bold = false,
					italic = true,
				},
				warning_diagnostic_selected = {
					fg = "#F1C40F",
					bold = false,
					italic = true,
				},
				error_diagnostic_selected = {
					fg = "#E74C3C",
					bold = false,
					italic = true,
				},
			},
		})

		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<leader>x", "<Cmd>bdelete!<CR>", { desc = "Close buffer" })
	end,
}
