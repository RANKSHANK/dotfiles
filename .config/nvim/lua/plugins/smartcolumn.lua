return {
	"m4xshen/smartcolumn.nvim",
	config = function()
		require("smartcolumn").setup({
			limit_to_window = true,
		})
	end,
}
