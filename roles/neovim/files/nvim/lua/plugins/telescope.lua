local mapkey = require("util.keymapper").mapkey

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			file_ignore_patterns = { "node_modules", ".git" },
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
				no_ignore = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = true,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		mapkey("<leader>fk", "Telescope keymaps", "n"),
		mapkey("<leader>fh", "Telescope help_tags", "n"),
		mapkey("<leader>ff", "Telescope find_files", "n"),
		mapkey("<leader>fg", "Telescope live_grep", "n"),
		mapkey("<leader>fl", "Telescope grep_string", "n"),
		mapkey("<leader>fb", "Telescope buffers", "n"),
		mapkey("<leader>fo", "Telescope oldfiles", "n"),
		mapkey("<leader>fc", "AdvancedGitSearch search_log_content", "n"),
		mapkey("<leader>fbc", "AdvancedGitSearch search_log_content_file", "n"),
		mapkey("<leader>fr", "Telescope registers", "n"),
	},
}
