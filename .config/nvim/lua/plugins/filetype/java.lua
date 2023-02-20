local mason_pkg_path = (vim.fn.stdpath("data")) .. "/mason/packages"

local bundle_jars = {}

local java_debug_adapter_root = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
local java_debug_jar_parent = java_debug_adapter_root .. "/extension/server"
local java_debug_jar_pattern = java_debug_jar_parent .. "/com.microsoft.java.debug.plugin-*.jar"
local java_debug_jar = vim.fn.glob(java_debug_jar_pattern, 1)
vim.list_extend(bundle_jars, { java_debug_jar })

local java_test_root = require("mason-registry").get_package("java-test"):get_install_path()
local java_test_jars_parent = java_test_root .. "/extension/server"
local java_test_jars_pattern = java_test_jars_parent .. "/*.jar"
local java_test_jars = vim.fn.glob(java_test_jars_pattern, 1)
local java_test_jar_list = vim.split(java_test_jars, "\n")
vim.list_extend(bundle_jars, java_test_jar_list)

local launch_cmd = {
	"java",
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	"-Dosgi.bundles.defaultStartLevel=4",
	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	"-Dlog.protocol=true",
	"-Dlog.level=ALL",
	"-javaagent:" .. os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
	"-Xms1g",
	"--add-modules=ALL-SYSTEM",
	"--add-opens",
	"java.base/java.util=ALL-UNNAMED",
	"--add-opens",
	"java.base/java.lang=ALL-UNNAMED",
	"-jar",
	vim.fn.glob(
		os.getenv("HOME")
			.. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
	),
	"-configuration",
	os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
	"-data",
	os.getenv("HOME") .. "/.workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
}

return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		require("jdtls").start_or_attach({
			cmd = launch_cmd,
			root_dir = vim.fs.dirname(vim.fs.find({
				".gradlew",
				".git",
				"mvnw",
				"pom.xml",
				"build.gradle",
			}, { upward = true })[1]),
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			settings = {
				java = {
					configuration = {
						updateBuildConfiguration = "interactive",
					},
					eclipse = {
						downloadSources = true,
					},
					maven = {
						downloadSources = true,
					},
					implementationsCodeLens = {
						enabled = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					inlayHints = {
						parameterNames = {
							enabled = "all",
						},
					},
					format = {
						enabled = false,
					},
				},
				signatureHelp = { enabled = true },
				-- extendedClientCapabilities = extendedClientCapabilities,,
				completion = {
					favoriteStaticMembers = {
						"org.hamcrest.MatcherAssert.assertThat",
						"org.hamcrest.Matchers.*",
						"org.hamcrest.CoreMatchers.*",
						"org.junit.jupiter.api.Assertions.*",
						"java.util.Objects.requireNonNull",
						"java.util.Objects.requireNonNullElse",
						"org.mockito.Mockito.*",
					},
				},
				contentProvider = { preferred = "fernflower" },
				--	extendedClientCapabilities = {
				--        progressReportProvider = false,
				--    },
				sources = {
					organizeImports = {
						starThreshold = 9999,
						staticStarThreshold = 9999,
					},
				},
				codeGeneration = {
					toString = {
						template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
					},
					useBlocks = true,
				},
			},
			flags = {
				allow_incremental_sync = true,
			},
			on_attach = function(client, bufnr)
				local _, _ = pcall(vim.lsp.codelens.refresh)
				require("jdtls.setup").add_commands()
				require("jdtls").setup_dap({ hotcodereplace = "auto" })
				require("jdtls.dap").setup_dap_main_class_configs()
			end,
			init_options = {
				bundles = bundle_jars,
				extendedClientCapabilities = {
					progressReportProvider = false,
				},
			},
		})
	end,
}
