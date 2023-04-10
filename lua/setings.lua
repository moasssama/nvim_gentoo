local opt = vim.opt
opt.number=true
vim.cmd([[ 
  hi VimwikiLink guifg=Red
  set relativenumber
  set encoding=utf8
  let g:mapleader = " "
  set mouse=a
  set wildmenu
  set confirm
  set incsearch
  set title
  set t_Co=256
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set cursorline
  syntax on 
  syntax enable
  set scrolloff=999
  set autoindent  
  set smartindent  
  set smarttab  
  set signcolumn=yes  
  augroup packer_user_config
  autocmd!
    autocm BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
"system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
"nmap <c-v> "+p
imap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+

" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>
set breakindent
"set showbreak=>>>﬌
set showbreak=﬌
  set ignorecase
  set wrap  
set termguicolors
let extension = expand('%:e') 

nnoremap <C-n> :NvimTreeToggle<CR>
vmap <leader>c :CommentToggle<CR>
nmap <leader>c :CommentToggle<CR>
nmap <leader>ee :Telescope file_browser<CR>

let g:onedark_color_overrides = {
\ "background": {"gui": "#000", "cterm": "#000235", "cterm16": "#000" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}
set background=dark
"colorscheme gruvbox-material
colorscheme pinkmare
hi VimwikiLink guifg=#87c095 gui=underline




if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    " g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
"let g:neovide_transparency = 0.0
"let g:transparency = 0.8
"let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
"let g:neovide_floating_blur_amount_x = 2.0
"let g:neovide_floating_blur_amount_y = 2.0
"let g:neovide_scroll_animation_length = 0.3
"let g:neovide_cursor_vrx_mode = "ripple"
"set guifont=mononoki\ NF:h15
endif

" vimwiki
let g:vimwiki_list = [{'path': '~/pCloudDrive/vimwiki/', 
      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_markdown_link_ext=1

"set pumblend=25
set pumblend=15
autocmd User TelescopePreviewerLoaded setlocal wrap
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0
let g:neovide_hide_mouse_when_typing = v:true
let g:neovide_scroll_animation_length = 0.05
let g:neovide_cursor_animation_length=0.025

]])

opt.guifont= "JetBrainsMono NF,Noto Color Emoji"

--" onedark.vim override: Don't set a background color when running in a terminal;
--" just use the terminal's background color
--" `gui` is the hex color code used in GUI mode/nvim true-color mode
--" `cterm` is the color code used in 256-color mode
--" `cterm16` is the color code used in 16-color mode
--if (has("autocmd") && !has("gui_running"))


--" `bg` will not be styled since there is no `bg` setting



--CONFIG DO NVIM-TREE
-- empty setup using defaults: add your own options
require'nvim-tree'.setup {
}
-- OR

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = true,
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = true,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  hijack_directories = {
    enable = false,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS

