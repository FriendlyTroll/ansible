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
local ansible_file_group = vim.api.nvim_create_augroup("AnsibleFileGroup", {})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = ansible_file_group,
	pattern = { "*/ansible/*.yml", "*/roles*/*.yml", "*/playbooks*/*.yml" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "yaml.ansible")
	end,
})

-- automatically decrypt ansible vault when reading it
-- see lua/config/keymaps.lua to encrypt
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*/group_vars/**/vault.yml", "*/group_vars/**/cr[ei]dentials.yml" },
	command = [[ %!ansible-vault decrypt --output -]],
})

-- set Jenkinsfile to groovy type
local filetypes_group = vim.api.nvim_create_augroup("AnsibleFileGroup", {})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = filetypes_group,
	pattern = { "Jenkinsfile" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "groovy")
	end,
})

-- set Jinja filetype
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = filetypes_group,
	pattern = { "*.j2" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "jinja2")
	end,
})

-- open Nvim tree on nvim enter
local nvim_enter = vim.api.nvim_create_augroup("NvimEnter", {})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = nvim_enter,
	callback = function()
		vim.cmd("NvimTreeOpen")
	end,
})

-- jinja comments
local comments = vim.api.nvim_create_augroup("Comments", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = comments,
	pattern = { "jinja2" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.bo[buf].commentstring = "{# %s #}"
	end,
})
