-- remap leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = {noremap = false, silent = false}

local modes = {
  insert_mode = 'i',
  normal_mode = 'n',
  term_mode = 't',
  visual_mode = 'v',
  visual_block_mode = 'x',
  command_mode = 'c',
  operator_pending_mode = 'o',
}

local keymappings = {
  insert_mode = {
    {keys = 'jk', command = '<ESC>', desc = 'Homerow ESC alternative'},
    {keys = '<A-j>', command = '<Esc>:m .+1<CR>==gi', desc = 'Move line down'},
    {keys = '<A-k>', command = '<Esc>:m .-2<CR>==gi', desc = 'Move line up'},
  },
  normal_mode = {
    -- Navigate between splits
    {keys = '<C-h>', command = '<C-w>h', desc = 'Move to left split'},
    {keys = '<C-j>', command = '<C-w>j', desc = 'Move to split below'},
    {keys = '<C-k>', command = '<C-w>k', desc = 'Move to split above'},
    {keys = '<C-l>', command = '<C-w>l', desc = 'Move to right split'},

    -- Move current line
    {keys = '<A-j>', command = '<Cmd>m .+1<CR>==', desc = 'Move line down'},
    {keys = '<A-k>', command = '<Cmd>m .-2<CR>==', desc = 'Move line up'},

    -- Telescope
    {keys = '<C-f>', command = '<Cmd>Telescope live_grep<CR>', desc = 'Find in files'},
    {keys = '<C-s>', command = '<Cmd>Telescope find_files<CR>', desc = 'Find files'},

    -- Buffers
    {keys = '<A-,>', command = '<Cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer'},
    {keys = '<A-.>', command = '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer'},
    {keys = '<A-<>', command = '<Cmd>BufferLineMovePrev<CR>', desc = 'Move buffer left'},
    {keys = '<A->>', command = '<Cmd>BufferLineMoveNext<CR>', desc = 'Move buffer right'},
    {keys = '<A-1>', command = '<Cmd>BufferLineGoToBuffer 1<CR>', desc = 'Go to buffer 1'},
    {keys = '<A-2>', command = '<Cmd>BufferLineGoToBuffer 2<CR>', desc = 'Go to buffer 2'},
    {keys = '<A-3>', command = '<Cmd>BufferLineGoToBuffer 3<CR>', desc = 'Go to buffer 3'},
    {keys = '<A-4>', command = '<Cmd>BufferLineGoToBuffer 4<CR>', desc = 'Go to buffer 4'},
    {keys = '<A-5>', command = '<Cmd>BufferLineGoToBuffer 5<CR>', desc = 'Go to buffer 5'},
    {keys = '<A-6>', command = '<Cmd>BufferLineGoToBuffer 6<CR>', desc = 'Go to buffer 6'},
    {keys = '<A-7>', command = '<Cmd>BufferLineGoToBuffer 7<CR>', desc = 'Go to buffer 7'},
    {keys = '<A-8>', command = '<Cmd>BufferLineGoToBuffer 8<CR>', desc = 'Go to buffer 8'},
    {keys = '<A-9>', command = '<Cmd>BufferLineGoToBuffer 9<CR>', desc = 'Go to buffer 9'},
    {keys = '<A-0>', command = '<Cmd>BufferLineGoToBuffer -1<CR>', desc = 'Go to last buffer'},
    {keys = '<A-p>', command = '<Cmd>BufferLineTogglePin<CR>', desc = 'Pin buffer'},
    {keys = '<A-c>', command = '<Cmd>Bdelete<CR>', desc = 'Close buffer'},
  },
  visual_mode = {
    {keys = '<', command = '<gv', desc = 'Ident left'},
    {keys = '>', command = '>gv', desc = 'Ident right'},
    {keys = '<A-j>', command = "<Cmd>m '>+1<CR>gv-gv", desc = 'Move selected text down'},
    {keys = '<A-k>', command = "<Cmd>m '<-2<CR>gv-gv", desc = 'Move selected text up'},
  },
}

local map = function(mode, keys, commmand, description)
  local opts_with_desc = vim.deepcopy(opts)
  opts_with_desc['desc'] = description
  vim.keymap.set(mode, keys, commmand, opts_with_desc)
end

local load_keymaps = function()
  for mode, mappings in pairs(keymappings) do
    for _,mapping in ipairs(mappings) do
      map(modes[mode], mapping['keys'], mapping['command'], mapping['desc'])
    end
  end
end

load_keymaps()

