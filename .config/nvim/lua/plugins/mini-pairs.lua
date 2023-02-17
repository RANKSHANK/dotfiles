return {
  "echasnovski/mini.pairs",
	dependencies = {
		{ "echasnovski/mini.surround" },
	},

  config = function(_, opts)
    require("mini.pairs").setup(opts)
  end,
}
