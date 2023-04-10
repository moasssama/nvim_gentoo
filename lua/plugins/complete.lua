vim.cmd([[let extension = expand('%:e')
echo extension
]])
if extension == "html" then
  require("plugins.tabnine")
    require'cmp'.setup {
      sources = {
        { name = 'cmp_tabnine' },
      }
    }
else

  require("plugins.lsp")
end

--require("plugins.tabnine")
--require'cmp'.setup {
--  sources = {
--    { name = 'cmp_tabnine' },
--  }
--}
