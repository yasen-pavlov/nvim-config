-- colorscheme settings

-- material theme config
vim.g.material_style = 'darker'

-- try to load colorscheme with fallback
vim.cmd [[
try
  colorscheme material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
