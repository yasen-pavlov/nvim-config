-- Lualine setup
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify('lualine not found!')
  return
end

lualine.setup {
  options = {
    theme = 'material-stealth',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = ''},
  }
}

