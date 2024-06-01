local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = blue })
vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = green, bg = blue })
vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = green })

dashboard.section.header.val = {
        "         //                 /*          ",
        "      ,(/(//,               *###        ",
        "    ((((((////.             /####%*     ",
        " ,/(((((((/////*            /########   ",
        "/*///((((((//////.          *#########/ ",
        "//////((((((((((((/         *#########/.",
        "////////((((((((((((*       *#########/.",
        "/////////(/(((((((((((      *#########(.",
        "//////////.,((((((((((/(    *#########(.",
        "//////////.  /(((((((((((,  *#########(.",
        "(////////(.    (((((((((((( *#########(.",
        "(////////(.     ,#((((((((((##########(.",
        "((//////((.       /#((((((((##%%######(.",
        "((((((((((.         #(((((((####%%##%#(.",
        "((((((((((.          ,((((((#####%%%%%(.",
        " .#(((((((.            (((((#######%%   ",
        "    /(((((.             .(((#%##%%/*    ",
        "      ,(((.               /(#%%#        ",
        "        ./.                 #*          ",
        "                                        ",
    }


dashboard.section.buttons.val = {
   dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("c", "  Configuration", ":e ~/.config/nvim/<CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
 return "Don't Stop Until You are Proud..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

