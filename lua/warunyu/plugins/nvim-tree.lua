return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#5499C7 ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#5499C7 ]])

		-- configure nvim-tree
		nvimtree.setup({
			hijack_cursor = true,
			focus_empty_on_setup = true,
			sync_root_with_cwd = true,
			renderer = {
				full_name = true,
				group_empty = true,
				special_files = {},
				symlink_destination = false,
				indent_markers = {
					enable = false,
				},
				icons = {
					git_placement = "signcolumn",
					show = {
						file = true,
						folder = false,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "󰆤",
						modified = "●",
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "",
							deleted = "",
							ignored = "◌",
						},
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			update_focused_file = {
				enable = true,
				update_root = true,
				ignore_list = { "help" },
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			filters = {
				custom = {
					"^.git$",
				},
			},
			actions = {
				change_dir = {
					enable = false,
					restrict_above_cwd = true,
				},
				open_file = {
					resize_window = true,
					window_picker = {
						chars = "aoeui",
					},
				},
				remove_file = {
					close_window = false,
				},
			},
			log = {
				enable = false,
				truncate = true,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFocus<CR>")
	end,
}
