local telescope = require('telescope')

telescope.setup({
	defaults = {
		prompt_prefix = '🔍 ',
		selection_caret = ' ',
		path_display = { 'smart' },
	},
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('ui-select')
