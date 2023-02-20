local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")

require("lazy").setup({
	require("config.theme"),
	{
		"LazyVim/LazyVim",
		import = "lazyvim.config",
		import = "lazyvim.plugins.core",
		import = "lazyvim.plugins.util",
		priority = 999,
		defaults = {
			colorscheme = "catppuccin",

			lazy = false,
		},
	},
	{
		priority = 1,
		import = "plugins",
	},
    {
        priority = 0,
        import = "plugins.filetype",
    },
})
