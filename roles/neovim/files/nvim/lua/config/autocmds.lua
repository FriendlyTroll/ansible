-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

-- set filetype for ansible files in ansible directory for lspconfig
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*/ansible/*.yml" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "yaml.ansible")
	end,
})

-- automatically decrypt ansible vault when reading it
-- see lua/config/keymaps.lua to encrypt
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*/group_vars/**/vault.yml" },
	command = [[ %!ansible-vault decrypt --output -]],
})
