local filetypes_group = vim.api.nvim_create_augroup("FileTypes", {})
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
local comments = vim.api.nvim_create_augroup("Comments", {})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "auto-format on save",
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "set filetype for ansible files in ansible directory for lspconfig",
	pattern = { "*/ansible/*.yml", "*/roles*/*.yml", "*/playbooks*/*.yml" },
	group = filetypes_group,
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "yaml.ansible")
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	desc = "automatically decrypt ansible vault when reading it. see lua/config/keymaps.lua to encrypt",
	group = filetypes_group,
	pattern = { "*/group_vars/**/vault.yml", "*/group_vars/**/cr[ei]dentials.yml" },
	command = [[ %!ansible-vault decrypt --output -]],
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "set Jenkinsfile to groovy type",
	group = filetypes_group,
	pattern = { "Jenkinsfile" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "groovy")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "set Jinja filetype",
	group = filetypes_group,
	pattern = { "*.j2" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "jinja")
	end,
})

-- -- open Nvim tree on nvim enter
-- local nvim_enter = vim.api.nvim_create_augroup("NvimEnter", {})
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	group = nvim_enter,
-- 	callback = function()
-- 		vim.cmd("NvimTreeOpen")
-- 	end,
-- })
--

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "set jinja comments",
	group = comments,
	pattern = { "jinja" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.bo[buf].commentstring = "{# %s #}"
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	desc = "format terraform file before writing it",
	group = filetypes_group,
	callback = function(opts)
		if vim.bo[opts.buf].filetype == "terraform" then
			vim.cmd("terraform fmt")
		end
	end,
})
