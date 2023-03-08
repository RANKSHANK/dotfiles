return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			dim_inactive = {
				enabled = true,
				percentage = 0.35,
			},
			integrations = {
				notify = true,
				mini = true,
			},
		})
		vim.cmd([[colorscheme catppuccin]])
	end,
}
