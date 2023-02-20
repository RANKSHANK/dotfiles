return {
	"Wansmer/treesj",
	lazy = true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>cs", "<CMD>TSJToggle<CR>", desc = "Split/Join Toggle" },
	},
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})
	end,
}
