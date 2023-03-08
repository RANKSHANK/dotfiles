return {
	"shortcuts/no-neck-pain.nvim",
	lazy = true,
	keys = {
		{ "<leader>uct", "<CMD>NoNeckPain<CR>", desc = "Toggle Centered Editor" },
		{ "<leader>uck", "<CMD>NoNeckPainWidthUp<CR>", desc = "Increase Centered Editor Width" },
		{ "<leader>ucj", "<CMD>NoNeckPainWidthDown<CR>", desc = "Decrease Centered Editor Width" },
	},
    opts = {
        buffers = {
            blend = -0.3,
            scratchPad = {
                enabled = true,
                location = "~/Documents/scratch/",
            },
            bo = {
                filetype = "md"
            }
        }
    }
}
