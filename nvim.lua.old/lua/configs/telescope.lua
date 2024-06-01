local icons = require("icons")

require('telescope').setup{
  defaults = {
    -- ...
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      prompt_prefix = icons.kind.Picker,
    }
  },
  extensions = {
    -- ...
  }
}
