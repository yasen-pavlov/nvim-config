require('material').setup({
	styles = {
		comments = { italic = true },
	},
	plugins = {
		'dap',
		'eyeliner',
		'fidget',
		'gitsigns',
		'illuminate',
		'indent-blankline',
		'nvim-cmp',
		'nvim-navic',
		'nvim-tree',
		'nvim-web-devicons',
		'rainbow-delimiters',
		'trouble',
		'which-key',
		'nvim-notify',
	},
	disable = {
		colored_cursor = false,
		borders = false,
		background = false,
		term_colors = false,
		eob_lines = true,
	},
	high_visibility = {
		lighter = true,
		darker = false,
	},
	lualine_style = 'stealth',
	custom_highlights = {
		LspInlayHint = {
			fg = '#757575',
			italic = true,
		},
	},
	custom_colors = function(colors)
		colors.editor.fg = '#EEFFFF'
		colors.editor.fg_dark = '#EEFFFF'
	end,
})

-- set style
vim.g.material_style = 'darker'

-- set as default colorscheme
vim.cmd([[colorscheme material]])
