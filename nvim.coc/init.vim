
" Basics Configuration {{{
:syntax sync minlines=100
:syntax sync maxlines=240
:set synmaxcol=800
:syntax on
:set relativenumber
:set number
:set smartindent
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop
:set mouse=a
:set ignorecase
:set nocompatible
:set foldmethod=marker
:set foldmarker={{{,}}}
:set clipboard=unnamedplus
:set backspace=indent,eol,start
:set wrap!
highlight ColorColumn ctermbg=0 guibg=lightgrey
" }}} 

" Plugins {{{
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'norcalli/nvim-colorizer.lua' 
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'sheerun/vim-polyglot' " syntax hightlight
Plug 'arcticicestudio/nord-vim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'https://github.com/jiangmiao/auto-pairs' " auto close pairs

" Flutter {{{
" Plug 'akinsho/flutter-tools.nvim'
Plug 'dart-lang/dart-vim-plugin' " dart 
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'natebosch/dartlang-snippets'
" }}}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy
Plug 'morhetz/gruvbox'  " color
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }

" Plug 'nvim-lualine/lualine.nvim'

Plug 'mattn/emmet-vim' " html snippets

Plug 'fannheyward/telescope-coc.nvim'

Plug 'skammer/vim-css-color'

Plug 'https://github.com/tpope/vim-commentary'

"Web {{{
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
"}}}

"Laravel {{{
Plug 'tpope/vim-dispatch'             "| Optional
Plug 'tpope/vim-projectionist'        "|
Plug 'noahfrederick/vim-composer'     "|
Plug 'noahfrederick/vim-laravel'
"}}}

set encoding=UTF-8
call plug#end()
"}}}



" coc-vimtex 
":colorscheme gruvbox

" Airline {{{
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Flutter {{{
nnoremap fa :FlutterRun<cr>
nnoremap fq :FlutterQuit<cr>
nnoremap fr :FlutterHotReload<cr>
nnoremap fR :FlutterHotRestart<cr>
nnoremap fD :FlutterVisualDebug<cr>
nnoremap fv :FlutterVSplit<cr>

let g:flutter_hot_reload_on_save = 1
let g:flutter_hot_restart_on_save = 1
let g:flutter_show_log_on_run = 1
let g:flutter_autoscroll = 1
let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']
" }}}

let mapleader=" "
nnoremap <leader>nh :nohl<CR>

let g:coc_global_extensions = [
    "\ 'coc-tsserver',
    \ 'coc-json',
    "\ 'coc-html',
    "\ 'coc-css',
    "\ 'coc-phpls',
    "\ 'coc-python',
	"\ 'coc-diagnostic'
	"\ 'coc-docker'
	\ 'coc-flutter',
	\ 'coc-snippets',
	\ 'coc-flutter-tools'
    \]

"Coc {{{
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
endif
"}}}

" Confirm autocompletion using Enter or Tab
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-Y>" : "\<Tab>" 

"FZF
nnoremap <leader>f :FZF<CR>

"telescope
"nnoremap <leader>f :Telescope find_files<CR>
"nnoremap <leader>g :Telescope live_grep<CR>

"{{{ Web
"for php acceleration
let g:loaded_matchparen = 1

let g:cssColorVimDoNotMessMyUpdatetime = 1
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
"}}}

" coc-explorer
" :nmap <space>b <Cmd>CocCommand explorer<CR>

"Nvim-tree
nnoremap <leader>b :NvimTreeToggle<CR>
" lua section
lua << EOF
require("telescope").setup({
  extensions = {
    coc = {
        theme = 'ivy',
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  },
})
require('telescope').load_extension('coc')

-- lualine {{{
--require('lualine').setup {
--  options = {
--    icons_enabled = true,
--    theme = 'auto',
--    section_separators = { left = '', right = '' },
--    component_separators = { left = '', right = '' },
--    disabled_filetypes = {
--      statusline = {},
--      winbar = {},
--    },
--    ignore_focus = {},
--    always_divide_middle = true,
--    globalstatus = false,
--    refresh = {
--      statusline = 1000,
--      tabline = 1000,
--      winbar = 1000,
--    },
--  },
--  sections = {
--    lualine_a = {'mode'},
--    lualine_b = {'branch', 'diff', 'diagnostics'},
--    lualine_c = {'filename'},
--    lualine_x = {'encoding', 'fileformat', 'filetype'},
--    lualine_y = {'progress'},
--    lualine_z = {'location'}
--  },
--  inactive_sections = {
--    lualine_a = {},
--    lualine_b = {},
--    lualine_c = {'filename'},
--    lualine_x = {'location'},
--    lualine_y = {},
--    lualine_z = {}
--  },
--  tabline = {},
--  winbar = {},
--  inactive_winbar = {},
--  extensions = {}
--}
-- }}}

-- Nvim-Tree {{{
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
require("nvim-tree").setup({
  -- change folder arrow icons
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    highlight_modified = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
            arrow_closed = "",
            arrow_open = "", 
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  --ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
-- }}}

EOF

