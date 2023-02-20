return {
	"simrat39/symbols-outline.nvim",
	lazy = true,
	keys = {
		{ "<leader>co", "<CMD>SymbolsOutline<CR>", desc = "Code Outline" },
	},
	config = function()
		require("symbols-outline").setup({})
	end,
}
