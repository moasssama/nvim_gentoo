require'nvim-web-devicons'.get_icons()
require('colorizer').setup()
require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})

--lsp  
require("nvim-lsp-installer").setup {}
 require("mason").setup {
     ui = {
         icons = {
             package_installed = "✓"
         }
     }
 }

require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "rust_analyzer" },
    }
require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup {}
-- -- require("lspconfig").rust_analyzer.setup {}
-- -- ...

require("lspconfig").cssls.setup {}

local lsp_status = require('lsp-status')
lsp_status.register_progress()
--function! LspStatus() abort
--  if luaeval('#vim.lsp.buf_get_clients() > 0')
--    return luaeval("require('lsp-status').status()")
--  endif
--
--  return ''
--endfunction
--local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local signs = { Error = "✗", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lspconfig = require('lspconfig')
-- Some arbitrary servers
lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

--lspconfig.pyls_ms.setup({
--  handlers = lsp_status.extensions.pyls_ms.setup(),
--  settings = { python = { workspaceSymbols = { enabled = true }}},
--  on_attach = lsp_status.on_attach,
--  capabilities = lsp_status.capabilities
--})

lspconfig.ghcide.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
lspconfig.rust_analyzer.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

--lspconfig.sumneko_lua.setup{
--  settings ={
--    diagnostics = {
--      globals = {'use', 'vim'}
--    }
--  }
--}
--  lspconfig.lua.setup{
--    settings = {
--      Lua = {
--        diagnostics = {
--          globals = {'vim'}
--        }
--      }
--    }
--  }
local navic = require('nvim-navic')
--require'lspconfig'.sumneko_lua.setup{
--require'lspconfig'.lua_ls.setup{
--  settings ={
--    lua = {
--      runtime = {
--        version = 'LuaJIT',
--      },
--      diagnostics = {
--        globals = {'vim'},
--    },
--  }
--},
--on_attach = function (client,bufnr)
--  navic.attach(client,bufnr)
--end
--}
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local navic = require('nvim-navic')
require'lspconfig'.html.setup {
  on_attach = function (client,bufnr)
    navic.attach(client,bufnr)
  end,
  capabilities = capabilities,
}

local navic = require('nvim-navic')
require'lspconfig'.tsserver.setup{
  on_attach = function (client,bufnr)
    navic.attach(client,bufnr)
  end,
  capabilities = capabilities,
}
--require'emmet_ls'.setup{}
local navic = require('nvim-navic')
require'lspconfig'.cssls.setup{
  on_attach = function (client,bufnr)
    navic.attach(client,bufnr)
  end,
  capabilities = capabilities,
}


--lualine bufferline

require("bufferline").setup{}
local function hello()
  return [[]]
end
local function ico()
  return [[]]
end
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
   -- section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {
        options = { theme = gruvbox},
      },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
--    lualine_a = {'mode'},
   --lualine_a = {'mode'} ,
   lualine_a = {hello} ,
    lualine_b = {'branch', 'diff', 'diagnostics'},
--    lualine_c = {'filename'},
    lualine_c = {''},
--    lualine_x = {'encoding', 'fileformat', 'filetype'},
--    lualine_x = {'', '', 'filetype'},
    lualine_x = {
      {'filetype', icon_only = true}
    },
--   lualine_y = {'progress'},
--    lualine_z = {'location'}
    lualine_z = {''}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
--    lualine_c = {'filename'},
    lualine_x = {{navic.get_location},'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {
     lualine_b = {{'filetype',icon_only = true},{navic.get_location}},
  lualine_a = {ico},
  --lualine_c = {{'filename', hide_filename_extension = false,}},
  lualine_c = {{}},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
  },
  inactive_winbar = {},
  extensions = {}
}
