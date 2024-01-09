return {
	"aaronhallaert/advanced-git-search.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		-- to show diff splits and open commits in browser
		"tpope/vim-fugitive",
	},
	config = function()
		-- optional: setup telescope before loading the extension
		require("telescope").setup({
			extensions = {
				advanced_git_search = {},
			},
		})

		require("telescope").load_extension("advanced_git_search")
	end,
}
