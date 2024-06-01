return {
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = "neovim/nvim-lspconfig",

        ft = "rust",
        opts = function()
            return {
                server = {
                    on_attach = require("plugins.lsp").on_attach,
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                },
            }
        end,
        config = function(_, opts)
            return require("rust-tools").setup(opts)
        end,
    },
    {
        "saecki/crates.nvim",
        tag = "stable",
        ft = { "rust", "toml" },
        config = function(_, opts)
            local crate = require("crates")
            crate.setup(opts)
            crate.show()
        end,
    },
}
