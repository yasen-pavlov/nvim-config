local notify = require('notify')

notify.setup {
  background_colour = '#212121',
  timeout = 3000
}

vim.notify = notify

