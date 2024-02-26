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
				advanced_git_search = {
					telescope_theme = {
						search_log_content = {
							layout_config = { width = 0.8, height = 0.8 },
							layout_strategy = "vertical",
						},
						search_log_content_file = {
							layout_config = { width = 0.8, height = 0.8 },
							layout_strategy = "vertical",
						},
					},
				},
			},
		})

		require("telescope").load_extension("advanced_git_search")
	end,
}
