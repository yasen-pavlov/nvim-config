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
  e = { '<Cmd>NvimTreeToggle<CR>', 'Explore' },
  h = { '<Cmd>WhichKey<CR>', 'Key bindings help' },
  B = { '<Cmd>Telescope file_browser path=%:p:h select_buffer=true theme=ivy<CR>', 'File Browser' },
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
    name = 'Buffers',
    l = { '<Cmd>BufferLineCloseLeft<CR>', 'Close all buffers to the left' },
    r = { '<Cmd>BufferLineCloseRight<CR>', 'Close All buffers to the right' },
    e = { '<Cmd>BufferLineSortByExtension<CR>', 'Sort by extension' },
    d = { '<Cmd>BufferLineSortByDirectory<CR>', 'Sort by directory' },
  },
  g = {
    name = 'Git',
    g = { '<Cmd>lua require("lvim.core.terminal").lazygit_toggle()<CR>', 'Lazygit' },
    j = { '<Cmd>lua require("gitsigns").next_hunk({navigation_message = false})<CR>', 'Next Hunk' },
    k = { '<Cmd>lua require("gitsigns").prev_hunk({navigation_message = false})<CR>', 'Prev Hunk' },
    l = { '<Cmd>lua require("gitsigns").blame_line()<CR>', 'Blame' },
    p = { '<Cmd>lua require("gitsigns").preview_hunk()<CR>', 'Preview Hunk' },
    r = { '<Cmd>lua require("gitsigns").reset_hunk()<CR>', 'Reset Hunk' },
    R = { '<Cmd>lua require("gitsigns").reset_buffer()<CR>', 'Reset Buffer' },
    s = { '<Cmd>lua require("gitsigns").stage_hunk()<CR>', 'Stage Hunk' },
    u = { '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>', 'Undo Stage Hunk'},
    o = { '<Cmd>Telescope git_status<CR>', 'Open changed file' },
    b = { '<Cmd>Telescope git_branches<CR>', 'Checkout branch' },
    c = { '<Cmd>Telescope git_commits<CR>', 'Checkout commit' },
    C = { '<Cmd>Telescope git_bcommits<CR>','Checkout commit(for current file)',},
    d = { '<Cmd>Gitsigns diffthis HEAD<CR>','Git Diff',
    },
  },
}

local wk = require('which-key')
wk.register(mappings, opts)

