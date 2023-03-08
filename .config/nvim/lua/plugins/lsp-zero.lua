return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional

    },
    opts = {
        sources = {
            { name = "path" },
            { name = "nvim_lsp"},
            { name = "buffer", keyword_length = 3},
            { name = "luasnip", keyword_length = 2},
        },
    },
    config = function()
        require("mason.settings").set({
            ui = {
                border = "rounded",
            },
        })
        require("mason-lspconfig").setup({
            automatic_installation = true,
        })
        local lsp = require("lsp-zero").preset({
            name = "minimal",
            set_lsp_keymaps = false,
            manager_nvim_cmp = true,
            suggest_lsp_servers = true,
        })
        lsp.nvim_workspace()
        lsp.setup_nvim_cmp({
            documentation = {
                max_height = 15,
                max_width =  80,
                border = "rounded",
            },
            mappings = lsp.defaults.cmp_mappings({
            })
        })
        lsp.on_attach(function(client, buffnr)
            local function diagnostic_goto(next, severity)
                local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
                severity = severity and vim.diagnostic.severity[severity] or nil
                return function()
                    go({ severity = severity })
                end
            end
            require("which-key").register({
                buffer = buffnr,
                noremap = false,
                ["<C-a>"] = { vim.lsp.buf.code_action ,"Code Action", mode = {"n", "v"}, has = "codeAction"},
                ["<leader>c"] = {
                    d = { vim.diagnostic.open_float,"Line Diagnostics"},
                    r = { vim.lsp.buf.rename,"Rename"},
                    l = { "<CMD>LspInfo<CR>","LSP Info"},
                },
                ["g"] = {
                    d = { vim.lsp.buf.definition,"Definition"},
                    r = { vim.lsp.buf.references,"References"},
                    D = { vim.lsp.buf.declaration,"Declaration"},
                    I = { vim.lsp.buf.implementation,"Implementations"},
                    t = { vim.lsp.buf.type_definition,"Type Definition"},
                    K = { vim.lsp.buf.signature_help,"Signature Help", has = "signatureHelp"},
                },
                ["<c-k>"] = { vim.lsp.buf.signature_help,"Signature Help", has = "signatureHelp"},
                ["K"] = { vim.lsp.buf.hover, "Hover"},
                ["]"] = {
                    d = { diagnostic_goto(true),"Next Diagnostic"},
                    e = { diagnostic_goto(true, "ERROR"),"Next Error"},
                    w = { diagnostic_goto(true, "WARN"),"Next Warning"},
                },
                ["["] = {
                    d = { diagnostic_goto(false),"Previous Diagnostic"},
                    e = { diagnostic_goto(false, "ERROR"),"Previous Error"},
                    w = { diagnostic_goto(false, "WARN"),"Previous Warning"},
                },
            })
        end)
        lsp.setup()
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,

            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
            }
        })

    end
}
