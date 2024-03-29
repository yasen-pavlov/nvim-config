local builtin = require('statuscol.builtin')

require('statuscol').setup({
	relculright = true,
	bt_ignore = { 'NvimTree' },
	segments = {
		{
			text = { builtin.lnumfunc, ' ' },
			condition = { true, builtin.not_empty },
			click = 'v:lua.ScLa',
		},
		{ text = { '%s' }, click = 'v:lua.ScSa' },
		{
			text = { builtin.foldfunc },
			click = 'v:lua.ScFa',
		},
	},
})
