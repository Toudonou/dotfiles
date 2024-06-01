vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugin")
require("settings")
require("mappings")

-- plugings
require("configs.catppucin")
require("configs.nvim-tree")
require("configs.which-key")
require("configs.telescope")
require("configs.lualine")
require("configs.toggleterm")
require("configs.alpha-nvim")
require("configs.treesitter")
require("configs.auto-pairs")


require("configs.lsp.nvim-cmp")
require("configs.lsp.lspconfig")
require("configs.lsp.mason")

