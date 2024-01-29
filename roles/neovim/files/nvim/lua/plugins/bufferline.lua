local config = function()
	local bufferline = require("bufferline").setup()
end

return {
	"akinsho/bufferline.nvim",
	version = "4.5.0",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
}
