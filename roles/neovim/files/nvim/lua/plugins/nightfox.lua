return { 
	"EdenEast/nightfox.nvim", -- github url
	lazy = false,   -- always load immediately
	priority = 999, -- load this colorscheme before everything else (default nvim is 50)
	config = function()
		vim.cmd('colorscheme nightfox')
	end
}
