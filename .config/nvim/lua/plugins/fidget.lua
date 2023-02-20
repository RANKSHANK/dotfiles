return {
	"j-hui/fidget.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "LspAttach",
	config = function()
		require("fidget").setup({})
	end,
}
