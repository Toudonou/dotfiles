require("which-key").setup({
	plugins = {
	      marks = true,
	      registers = true,
	      spelling = {
		enabled = true,
		suggestions = 20,
	      },
	      presets = {
		operators = false,
		motions = false,
		text_objects = false,
		windows = false,
		nav = false,
		z = false,
		g = false,
	      },
	    },
	    window = {
	      border = "rounded",
	      position = "bottom",
	    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
},
    layout = {
--    height = { min = 29, max = 50 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
--    align = "center", -- align columns left, center or right
  },
	    ignore_missing = true,
	    show_help = true,
	    show_keys = true,
	    disable = {
	      buftypes = {},
	      filetypes = { "TelescopePrompt" },
	},
})
