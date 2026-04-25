require('snacks').setup({
	input = { enabled = true },
	notifier = { enabled = true, timeout = 2000 },
	picker = { enabled = true },
	gh = { enabled = true },
	bigfile = {
		enabled = true,
		notify = true,
		setup = function(ctx)
			vim.cmd([[NoMatchParen]])
			Snacks.util.wo(0, { foldmethod = 'manual', statuscolumn = '', conceallevel = 0 })
			vim.schedule(function()
				vim.bo[ctx.buf].syntax = ctx.ft
			end)
			pcall(function()
				require('illuminate').pause_buf()
			end)
			pcall(function()
				require('rainbow-delimiters').disable(ctx.buf)
			end)
			pcall(function()
				require('nvim-highlight-colors').turnOff()
			end)
			pcall(function()
				require('ibl').setup_buffer(ctx.buf, { enabled = false })
			end)
		end,
	},
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
