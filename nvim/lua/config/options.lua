vim.scriptencoding = "utf-8"

-- Map <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1              -- disable netrw
vim.g.loaded_netrwPlugin = 1        --  disable netrw

-- Editor options
vim.o.number = true                 -- Print the line number in front of each line
vim.o.relativenumber = true         -- Show the line number relative to the line with the cursor in front of each line.
vim.o.syntax = "on"                 -- When this option is set, the syntax with this name is loaded.
vim.o.autoindent = true             -- Copy indent from current line when starting a new line.
vim.o.cursorline = true             -- Highlight the screen line of the cursor with CursorLine.
vim.o.expandtab = true              -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
vim.o.shiftwidth = 4                -- Number of spaces to use for each step of (auto)indent.
vim.o.tabstop = 4                   -- Number of spaces that a <Tab> in the file counts for.
vim.o.encoding = "utf-8"            -- Sets the character encoding used inside Vim.
vim.o.fileencoding = "utf-8"        -- Sets the character encoding for the file of this buffer.
vim.o.ruler = true                  -- Show the line and column number of the cursor position, separated by a comma.
vim.o.mouse = "a"                   -- Enable the use of the mouse. "a" you can use on all modes
vim.o.title = true                  -- When on, the title of the window will be set to the value of 'titlestring'
vim.o.hidden = true                 -- When on a buffer becomes hidden when it is |abandon|ed
vim.o.ttimeoutlen = 0               -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
vim.o.wildmenu = true               -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
vim.o.showcmd = true                -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
vim.o.showmatch = true              -- When a bracket is inserted, briefly jump to the matching one.
vim.o.inccommand = "split"          -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
vim.o.splitbelow = "splitright"     -- When on, splitting a window will put the new window below the current one
vim.opt.updatetime = 100            -- faster completion (4000ms default)
vim.o.ignorecase = true
vim.o.wrap = false
