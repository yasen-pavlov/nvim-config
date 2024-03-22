local options = require('user/options')

-- load options
for k, v in pairs(options) do
	vim.opt[k] = v
end
