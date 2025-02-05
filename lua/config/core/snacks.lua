require('snacks').setup({
	styles = {
		---@diagnostic disable-next-line: missing-fields
		lazygit = {
			border = 'rounded',
			backdrop = { transparent = true, blend = 100 },
			wo = {
				winhighlight = 'FloatBorder:SnacksInputBorder',
			},
		},
		blame_line = {
			width = 0.6,
			height = 0.6,
			title = ' Git Blame ',
			title_pos = 'center',
			ft = 'git',
			border = 'rounded',
			backdrop = { transparent = true, blend = 100 },
			wo = {
				winhighlight = 'FloatBorder:SnacksInputBorder',
			},
		},
	},
})
