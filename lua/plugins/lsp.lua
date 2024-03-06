return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
        local map_lsp_keybinds = require("core.keymaps").map_lsp_keybinds
        require("mason").setup({
            ui = {
                border = "rounded",
            },
        })
        require("mason-lspconfig").setup({
            automatic_installation = true,
        })
        require("lspconfig").gopls.setup{
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,
        }
        require("lspconfig").phpactor.setup{
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,
        }
        require("lspconfig").eslint.setup{
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,
        }
        require("lspconfig").bashls.setup{
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,

        }
        require("lspconfig").cssls.setup{
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,

        }
        require("lspconfig").html.setup{
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,

        }
        require("lspconfig").jsonls.setup{
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,

        }
        require("lspconfig").yamlls.setup{
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,

        }
        require("lspconfig").lua_ls.setup{
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = {
                        globals = {
                            'vim',
                            'require',
                        },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            "${3rd}/luv/library",
                            unpack(vim.api.nvim_get_runtime_file('', true)),
                        },
                    },
                    telemetry = { enabled = false },
                },
            },
            on_attach = function(_, buffer_number)
                map_lsp_keybinds(buffer_number)
            end,
            config = function()
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
            end,
        }
    end,
}
