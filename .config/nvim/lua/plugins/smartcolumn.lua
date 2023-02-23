return {
	"m4xshen/smartcolumn.nvim",
	config = function()
		require("smartcolumn").setup({
			limit_to_window = true,
            disabled_filetypes = {
                "help",
                "text",
                "markdown",
                "mason",
                "nvim",
                "dashboard",
                "lazy",
                "alpha",
            }
		})
	end,
}
