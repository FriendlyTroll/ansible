local config = function()
	require("toggle_lsp_diagnostics").init()
end

return {
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	config = config,
}
