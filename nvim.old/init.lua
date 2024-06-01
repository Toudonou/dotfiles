require("settings")
require("plugins")
require("maps")

-- colorscheme config: catppuccin
local themeStatus, catppuccin = pcall(require, "catppuccin")

if themeStatus then
    vim.cmd("colorscheme catppuccin")
else
    return
end
