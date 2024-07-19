return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require("mason-lspconfig").setup({
            -- ensure_installed = vim.tbl_keys(require("plugins.lsp.servers")),
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "tsserver",
            },
        })
        require("lspconfig.ui.windows").default_options.border = "single"

        require("neodev").setup()

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end
                map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
                map("gr", require("telescope.builtin").lsp_references, "Goto References")
                map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
                map("go", require("telescope.builtin").lsp_type_definitions, "Type Definition")
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
                map("gD", vim.lsp.buf.declaration, "Goto Declaration")

                -- Thank you teej
                -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L502
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local on_attach = function(client, bufnr)
            -- format on save
            -- INFO: IN AUTO COMMAND
            -- if client.server_capabilities.documentFormattingProvider then
            --     vim.api.nvim_create_autocmd("BufWritePre", {
            --         group = vim.api.nvim_create_augroup("Format", { clear = true }),
            --         buffer = bufnr,
            --         callback = function()
            --             vim.lsp.buf.formatting_seq_sync()
            --         end,
            --     })
            -- end
        end

        -- configure clangd server (with special settings)
        lspconfig["clangd"].setup({
          cmd = { "clangd" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
          single_file_support = true,
          on_attach = on_attach,
          capabilities = capabilities,
          flags = lsp_flags,
          root_dir = nvim_lsp.util.root_pattern(
            '.clangd',
            '.clang-tidy',
            '.clang-format',
            'compile_commands.json',
            'compile_flags.txt',
            'configure.ac',
            '.git'
          ),
          -- init_option = { fallbackFlags = {  "-std=c++2a"  } }

        })

        -- configure tsserver server (with special settings)
        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        vim.diagnostic.config({
            title = false,
            underline = true,
            virtual_text = true,
            signs = true,
            update_in_insert = true,
            severity_sort = true,
            float = {
                source = "always",
                style = "minimal",
                border = "rounded",
                header = "",
                prefix = "",
            },
        })

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
    end,
}
