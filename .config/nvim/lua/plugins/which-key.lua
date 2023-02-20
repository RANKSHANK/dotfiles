return {
	"folke/which-key.nvim",
	dependencies = "LazyVim/Lazyvim",
	opts = {
		plugins = { spelling = true },
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		local keymaps = {
			mode = { "n", "v" },
			["g"] = { name = "+goto" },
			["gz"] = { name = "+surround" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader>b"] = { name = "+buffer" },
			["<leader>c"] = { name = "+code" },
			["<leader>d"] = { name = "+debug" },
			["<leader>f"] = { name = "+file/find" },
			["<leader>g"] = { name = "+git" },
			["<leader>gh"] = { name = "+hunks" },
			["<leader>q"] = { name = "+quit/session" },
			["<leader>s"] = { name = "+search" },
			["<leader>t"] = { name = "+todo" },
			["<leader>u"] = { name = "+ui" },
			["<leader>uc"] = { name = "+centered editor" },
			["<leader>w"] = { name = "+windows" },
			["<leader>x"] = { name = "+diagnostics/quickfix" },
		}
		keymaps["<leader>sn"] = { name = "+noice" }
		wk.register(keymaps)
	end,
}
