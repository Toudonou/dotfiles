local wk = require("which-key")

vim.g.mapleader = " "
vim.g.maplocalleader = " "


local mappings = {
    h = { ":nohlsearch<CR>", "Nohl" },
    b = { ":NvimTreeToggle<CR>", "Nvim-tree" },

    f = {
        name = "File Search",
        c = { ":Telescope colorscheme<cr>", "Colorscheme" },
        f = { ":lua require('telescope.builtin').find_files()<cr>", "Find files" },
        t = { ":Telescope live_grep <cr>", "Find Text Pattern" },
        r = { ":Telescope oldfiles<cr>", "Recent Files" },
    },


    l = {
        name = "LSP",
        f = { ":lua vim.lsp.buf.format{async=true}<cr>", "Reformat Code" },
        i = { ":LspInfo<cr>", "Info" },
        r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    },

    t = { ":ToggleTerm<CR>", "Find files" },
    p = { ":Lazy<CR>", "Plugin Manager" },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = " ",
}

wk.register(mappings, opts)
