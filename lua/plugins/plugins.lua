vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
 -- use 'terroo/vim-simple-emoji'
 use 'lewis6991/impatient.nvim'

  use 'navarasu/onedark.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'tamton-aquib/staline.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'lukas-reineke/indent-blankline.nvim'
  --use 'nvim-colorizer.lua'
  use 'norcalli/nvim-colorizer.lua'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'ray-x/lsp_signature.nvim'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'onsails/lspkind-nvim'
  -- using packer.nvim
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }


  --IDE

  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  require('gitsigns').setup()

  use {
        "williamboman/nvim-lsp-installer",
    }
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }

    use ('nvim-lua/lsp-status.nvim')

    use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
    }

    --use 'nvim-treesitter/nvim-treesitter'
    use 'sainnhe/gruvbox-material'
    use "EdenEast/nightfox.nvim" -- Packer
    use 'Mofiqul/dracula.nvim'
    use 'matsuuu/pinkmare'
    use 'vimwiki/vimwiki'
    --use 'junegunn/vim-emoji'
    use 'hrsh7th/cmp-emoji'

    -- Is using a standard Neovim install, i.e. built from source or using a
    -- provided appimage.
    use 'lewis6991/impatient.nvim'
    use { "nvim-telescope/telescope-file-browser.nvim" }
    -- You don't need to set any of these options.
    -- IMPORTANT!: this is only a showcase of how you can set default options!
    require("telescope").setup {
      require("telescope").setup({
        defaults = {
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
            },
          },
        },
      })
      --   extensions = {
        --     file_browser = {
          ----      theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          --       hijack_netrw = true,
          --       mappings = {
            --         ["i"] = {
              --           -- your custom insert mode mappings
              --         },
              --         ["n"] = {
                --           -- your custom normal mode mappings
                --         },
                --       },
                --     },
                --   },
              }
              -- To get telescope-file-browser loaded and working with telescope,
              -- you need to call load_extension, somewhere after setup function:
              require("telescope").load_extension "file_browser"
              use {'nvim-treesitter/nvim-treesitter',
              run = ':TSUpdate'}
              --require"nvim-treesitter.configs".setup{highlight={enable=true}}
              require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = { "c", "lua", "rust" },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,
                -- List of parsers to ignore installing (for "all")
                ignore_install = { "javascript" },
                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
                highlight = {
                  -- `false` will disable the whole extension
                  enable = true,
                  -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                  -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                  -- the name of the parser)
                  -- list of language that will be disabled
                  disable = { "c", "rust" },
                  -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                  disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                      return true
                    end
                  end,

                  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                  -- Using this option may slow down your editor, and you may see some duplicate highlights.
                  -- Instead of true it can also be a list of languages
                  additional_vim_regex_highlighting = false,
                  require'telescope'.setup {
                  }
                },
              }

end)
