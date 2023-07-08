-- nvim notify plugin config
local status_ok, notify = pcall(require, 'notify')
if not status_ok then
  return
end

notify.setup({
  background_colour = '#212121',
  timeout = 3000
})

vim.notify = notify

