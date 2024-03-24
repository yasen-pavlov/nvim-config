local options = require('user/options')

-- load options
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- fix for macos neovide not in focus on startup
if vim.g.neovide then
	vim.schedule(function()
		os.execute([[sleep 0.1 && osascript -e 'tell application "Neovide" to activate']])
	end)
end
