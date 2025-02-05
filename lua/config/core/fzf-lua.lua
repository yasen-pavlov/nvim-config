require('fzf-lua').setup({
	files = {
		find_opts = [[-type f -not -path '*/\.git/*' -not -path '*/\node_modules/*']],
		rg_opts = [[--color=never --files --hidden --follow -g "!.git" -g "!node_modules"]],
		fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules]],
	},
	grep = {
		grep_opts = '--binary-files=without-match --line-number --recursive --color=auto --perl-regexp --exclude-dir=node_modules -e',
		rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g "!node_modules" -e',
	},
	hls = { backdrop = 'Black' },
})
