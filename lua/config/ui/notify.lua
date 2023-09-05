local notify = require('notify')

notify.setup({
	background_colour = '#212121',
	timeout = 2000,
})

vim.notify = notify
