return {
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",
		},
		opts = function()
			-- On Attach and Capabilities
			local rust_tools = require("rust-tools")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach_utils = require("warunyu.utils.on-attach")
			local on_attach = function(client, bufnr)
				on_attach_utils(client, bufnr)

				vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
				vim.keymap.set("n", "<leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
			end

			-- codelldb
			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

			local options = {
				dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
				server = {
					on_attach = on_attach,
					capabilities = capabilities,
				},
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
			}

			return options
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
}
