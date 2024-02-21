return {
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",
		},
		opts = function()
			local on_attach = require("warunyu.utils.on-attach")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local options = {
				server = {
					on_attach = on_attach,
					capabilities = capabilities,
				},
			}

			return options
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"simrat39/inlay-hints.nvim",
		opts = function()
			local options = {
				-- renderer to use
				-- possible options are dynamic, eol, virtline and custom
				-- renderer = "inlay-hints/render/dynamic",
				renderer = "inlay-hints/render/eol",

				hints = {
					parameter = {
						show = true,
						highlight = "whitespace",
					},
					type = {
						show = true,
						highlight = "Whitespace",
					},
				},

				-- Only show inlay hints for the current line
				only_current_line = false,

				eol = {
					-- whether to align to the extreme right or not
					right_align = false,

					-- padding from the right if right_align is true
					right_align_padding = 7,

					parameter = {
						separator = ", ",
						format = function(hints)
							return string.format(" <- (%s)", hints):gsub(":", "")
						end,
					},

					type = {
						separator = ", ",
						format = function(hints)
							return string.format(" => %s", hints):gsub(":", "")
						end,
					},
				},
			}

			return options
		end,
		config = function(_, opts)
			require("inlay-hints").setup(opts)
		end,
	},
}
