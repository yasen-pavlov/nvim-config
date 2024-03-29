local ufo = require('ufo')
ufo.setup()

-- Using ufo provider need remap `zR` and `zM`.
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
