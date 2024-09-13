---@diagnostic disable: assign-type-mismatch
local rainbow_delimiters = {
	name = 'rainbow_delimiters',
	disable = function()
		require('rainbow-delimiters').disable(0)
	end,
}

local highlight_colors = {
	name = 'highlight_colors',
	disable = function()
		require('nvim-highlight-colors').turnOff()
	end,
}

require('bigfile').setup({
	features = {
		'indent_blankline',
		'illuminate',
		'lsp',
		'treesitter',
		'syntax',
		'matchparen',
		'vimopts',
		'filetype',
		rainbow_delimiters,
		highlight_colors,
	},
})
