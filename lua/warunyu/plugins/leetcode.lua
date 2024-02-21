return {
	-- configuration goes here
	arg = "leetcode.nvim",
	lang = "rust",
	injector = {
		["golang"] = {
			before = { "package main", "" },
		},
	},
}
