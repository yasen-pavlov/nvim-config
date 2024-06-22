local builtin = require('statuscol.builtin')

require('statuscol').setup({
	relculright = true,
	bt_ignore = { 'NvimTree' },
	segments = {
		-- Relative line numbers
		{
			text = { builtin.lnumfunc, ' ' },
			condition = { true, builtin.not_empty },
			click = 'v:lua.ScLa',
		},
		-- Signs
		{
			text = { '%s' },
			click = 'v:lua.ScSa',
		},
		-- Folds
		{
			text = { builtin.foldfunc },
			click = 'v:lua.ScFa',
		},
	},
})
