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
  b = { '<Cmd>Telescope file_browser path=%:p:h select_buffer=true theme=ivy<CR>', 'File Browser' },
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
  B = {
    name = 'Sort buffers',
    b = { '<Cmd>BufferOrderByBufferNumber<CR>', 'Sort by buffer number' },
    d = { '<Cmd>BufferOrderByDirectory<CR>', 'Sort by directory' },
    l = { '<Cmd>BufferOrderByLanguage<CR>', 'Sort by language' },
    w = { '<Cmd>BufferOrderByWindowNumber<CR>', 'Sort by window number' },
  },
  g = {
    name = "Git",
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
}

local wk = require('which-key')
wk.register(mappings, opts)

