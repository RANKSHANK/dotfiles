return {
	"williamboman/mason.nvim",
	dependencies = "williamboman/mason-lspconfig.nvim",
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	opts = {
		ensure_installed = {
			"stylua",
			"shellcheck",
			"shfmt",
			"flake8",
		},
	},
	---@param opts MasonSettings | {ensure_installed: string[]}
	config = function(plugin, opts)
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		mason.setup(opts)
		require("lspconfig.ui.windows").default_options.border = "rounded"
		local mr = require("mason-registry")
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
		mason.setup({
			ui = {
				check_outdated_packages_on_open = false,
				border = "single",
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},
		})
	end,
}
