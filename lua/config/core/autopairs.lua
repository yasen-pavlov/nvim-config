require('nvim-autopairs').setup({
	check_ts = true,
	ts_config = {
		lua = { 'string', 'source' },
		javascript = { 'string', 'template_string' },
		java = false,
	},
	fast_wrap = {
		manual_position = false,
	},
})
