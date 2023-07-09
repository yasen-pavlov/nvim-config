local opts = {
  mode = 'n', -- normal mode
  prefix = '<leader>', -- set leader key
  buffer = nil, -- create global mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  w = { '<Cmd>w!<CR>', 'Save' },
  q = { '<Cmd>q!<CR>', 'Quit' },
  e = { '<Cmd>Lexplore 30<CR>', 'Explore' },
  h = { '<Cmd>WhichKey<CR>', 'Key bindings help' },
  f = {
    name = 'Find',
    f = { '<Cmd>Telescope find_files<CR>', 'Find files' },
    g = { '<Cmd>Telescope live_grep<CR>', 'Find in files' },
    b = { '<Cmd>Telescope buffers<CR>', 'Find in buffers' },
    r = { '<Cmd>Telescope oldfiles<CR>', 'Find recent files' },
    h = { '<Cmd>Telescope help_tags<CR>', 'Find in help' },
    m = { '<Cmd>Telescope man_pages<CR>', 'Find in man pages' },
    C = { '<Cmd>Telescope commands<CR>', 'Find commands' },
    c = { '<Cmd>Telescope colorscheme<CR>', 'Find colorschemes' },
    R = { '<Cmd>Telescope registers<CR>', 'Find in registers' },
    l = { '<Cmd>Telescope resume<CR>', 'Resume last search' },
    T = { '<Cmd>Telescope<CR>', 'Open Telescope' },
  },
  p = {
    name = 'Plugins',
    i = { '<Cmd>Lazy install<CR>', 'Install' },
    s = { '<Cmd>Lazy sync<CR>', 'Sync' },
    S = { '<Cmd>Lazy clear<CR>', 'Status' },
    c = { '<Cmd>Lazy clean<CR>', 'Clean' },
    u = { '<Cmd>Lazy update<CR>', 'Update' },
    p = { '<Cmd>Lazy profile<CR>', 'Profile' },
    l = { '<Cmd>Lazy log<CR>', 'Log' },
    d = { '<Cmd>Lazy debug<CR>', 'Debug' },
  },
  b = {
    name = 'Sort buffers',
    b = { '<Cmd>BufferOrderByBufferNumber<CR>', 'Sort by buffer number' },
    d = { '<Cmd>BufferOrderByDirectory<CR>', 'Sort by directory' },
    l = { '<Cmd>BufferOrderByLanguage<CR>', 'Sort by language' },
    w = { '<Cmd>BufferOrderByWindowNumber<CR>', 'Sort by window number' },
  },
}

local wk = require('which-key')
wk.register(mappings, opts)

