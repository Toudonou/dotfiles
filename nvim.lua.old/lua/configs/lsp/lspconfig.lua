local lspconfig = require("lspconfig")

local cmp_nvim_lsp = require("cmp_nvim_lsp")

local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
    opts.buffer = bufnr
    local wk = require "which-key"

    wk.register {
        ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration", mode = "n", opts },
        ["gd"] = { "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions", mode = "n", opts },
        ["gt"] = { "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions", mode = "n", opts },
        ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Hover", mode = "n", opts },
        ["gi"] = { "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations", mode = "n", opts },
        ["gr"] = { "<cmd>Telescope lsp_references<CR>", "Show LSP references", mode = "n", opts },
        ["gl"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostic", mode = "n", opts },


        ["<leader>"] = {
            a = { vim.lsp.buf.code_action, "Code action", mode = "n", opts },
            r = { vim.lsp.buf.rename, "Smart rename", mode = "n", opts },
            --d = { vim.diagnostics.open_float, "Show line diagnostic", mode = "n", opts },
            D = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics", mode = "n", opts },
        }
    }
    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure clangd server
lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
-- rust
require 'lspconfig'.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false,
            }
        }
    }
}
-- configure html server
lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure typescript server with plugin
lspconfig["tsserver"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure svelte server
lspconfig["svelte"].setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
                if client.name == "svelte" then
                    client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                end
            end,
        })
    end,
})

-- configure prisma orm server
lspconfig["prismals"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure python server
lspconfig["pyright"].setup({
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
