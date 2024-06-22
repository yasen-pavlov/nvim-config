local telescope = require('telescope')

telescope.setup({
	defaults = {
		prompt_prefix = '🔍 ',
		selection_caret = ' ',
		path_display = { 'smart' },
		mappings = {
			i = {
				['<C-y>'] = 'select_default',
				['<CR>'] = 'select_default',
			},
		},
	},
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
