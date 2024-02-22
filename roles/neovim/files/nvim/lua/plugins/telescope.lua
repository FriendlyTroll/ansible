local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			file_ignore_patterns = { "node_modules", ".git/" },
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				-- theme = "dropdown",
				previewer = true,
				hidden = true,
				no_ignore = true,
			},
			live_grep = {
				-- theme = "dropdown",
				previewer = true,
			},
			buffers = {
				-- theme = "dropdown",
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
		vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>"),
		vim.keymap.set("n", "<leader>fh", ":Telescope command_history<CR>"),
		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
		vim.keymap.set("n", "<leader>fs", ":Telescope find_files search_dirs=/home,/etc<CR>"),
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>"),
		vim.keymap.set(
			"n",
			"<leader>fw",
			":Telescope grep_string<CR>",
			{ desc = "Search for word in entire project when selected in visual mode " }
		),
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
		vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>"),
		vim.keymap.set("n", "<leader>fc", ":AdvancedGitSearch search_log_content<CR>"),
		vim.keymap.set("n", "<leader>fbc", ":AdvancedGitSearch search_log_content_file<CR>"),
		vim.keymap.set("n", "<leader>fr", ":Telescope registers<CR>"),
		vim.keymap.set("n", "<leader>fl", ":Telescope current_buffer_fuzzy_find<CR>"),
		vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>", { desc = "Search for marks" }),
	},
}
