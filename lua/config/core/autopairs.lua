require('nvim-autopairs').setup({
	check_ts = true,
	ts_config = {
		lua = { 'string', 'source' },
		javascript = { 'string', 'template_string' },
		java = false,
	},
	fast_wrap = {},
})

-- configure cmp integration
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
