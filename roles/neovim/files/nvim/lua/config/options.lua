local opt = vim.opt -- so that we don't need to write vim.opt in lines below

-- Tab and indentations
opt.tabstop = 2 -- indentation on Tab
opt.shiftwidth = 2 -- number of spaces for each level of indentation
opt.softtabstop = 2 -- when in insert mode how many spaces to insert
opt.expandtab = true -- expand tabs to spaces
opt.smartindent = true -- autoindent
opt.wrap = false -- don't wrap long lines
opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"

-- Search
opt.incsearch = true -- highlight charactes when searching
opt.ignorecase = true -- ingore case when searching but...
opt.smartcase = true -- when using capital letters search for them
opt.hlsearch = true -- highlight search terms

-- Appearance
opt.number = true -- show numbers
opt.relativenumber = true -- use relative number lines
opt.termguicolors = true -- full color support in terminal, required by some plugins
--opt.colorcolumn = '80'	   -- add colored line on specified columne for visual aid
opt.signcolumn = "yes" -- reserve some space for signs
opt.cmdheight = 1 -- height of command line at bottom of nvim
opt.scrolloff = 10 -- start scrolling sooner when moving cursor up/down
opt.completeopt = "menuone,noinsert,noselect" -- behavior of completion menu

-- Behaviour
opt.hidden = true -- change buffers without saving them
opt.errorbells = false -- no sounds
opt.swapfile = true -- use swapfiles ?
opt.backup = false -- use backup files ?
opt.undodir = vim.fn.expand("~/.vim/undodir") -- undo directory
opt.undofile = true -- undo file
opt.backspace = "indent,eol,start" -- allow backspace functionality on these options
opt.splitright = true -- always split to right
opt.splitbelow = false -- always split below current pane
opt.autochdir = false -- don't auto change directory
opt.iskeyword:append("-") -- treat hyphenated words as full words
opt.mouse:append("a") -- mouse always available in all modes
opt.clipboard:append("unnamedplus") -- allow copy/paste outside of nvim
opt.modifiable = true -- edit buffer that you are in by default
opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- change cursor appearance
opt.encoding = "UTF-8" -- use this encoding
