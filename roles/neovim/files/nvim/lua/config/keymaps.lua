local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Directory navigation
keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
keymap.set("n", "<leader>l", ":NvimTreeFindFile<CR>", opts) -- Find file in nvim tree

-- Pane and Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right
keymap.set("n", "gq", "<C-w>q") -- quit window

-- Buffer navigation
keymap.set("n", "<C-n>", ":bnext<CR>", opts) -- Buffer right
keymap.set("n", "<C-p>", ":bprevious<CR>", opts) -- Buffer left
keymap.set("n", "<leader>x", ":bp|bd #<CR>", opts) -- Delete buffer
keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", opts) -- Delete all buffers except current

-- quickfix navigation
keymap.set("n", "[q", ":cprevious<CR>", opts)
keymap.set("n", "]q", ":cnext<CR>", opts)
keymap.set("n", "[Q", ":cfirst<CR>", opts)
keymap.set("n", "]Q", ":clast<CR>", opts)

-- Vim fugitive
keymap.set("n", "<leader>P", ":Git pull<CR>", opts) -- vim fugitive pull
keymap.set("n", "<leader>p", ":Git push<CR>", opts) -- vim fugitive push
keymap.set("n", "<F7>", ":G<CR>", opts) -- vim fugitive

-- Ansible stuff
keymap.set("n", "<leader>ae", ":%! ansible-vault encrypt --output -<CR>", opts) -- encrypt ansible vault

-- Hop nvim mappings
keymap.set("n", "<leader>w", ":HopWord<CR>", { desc = "Go to any word in the current buffer " })

keymap.set("n", "<F12>", ":ToggleDiag<CR>", { desc = "Toggle diagnostic messages" })
