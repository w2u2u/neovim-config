return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local ih = require("inlay-hints")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local on_attach = require("warunyu.utils.on-attach")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "rust" },
			root_dir = util.root_pattern("Cargo.toml"),
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})

		lspconfig.rubocop.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "ruby" },
			root_dir = util.root_pattern("Gemfile", ".git"),
			init_options = { formatting = true },
		})

		lspconfig.solargraph.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "ruby" },
			root_dir = util.root_pattern("Gemfile", ".git"),
			init_options = { formatting = true },
		})

		lspconfig.gopls.setup({
			on_attach = function(c, b)
				ih.on_attach(c, b)
			end,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					semanticTokens = true,
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					experimentalPostfixCompletions = true,
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		})

		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "python" },
		})

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
