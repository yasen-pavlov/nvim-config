-- load autocmds --

local autocmds = {

  -- disable comments continuation 
  {
    events = { 'BufEnter' },
    opts = {
      callback = function()
        vim.cmd('set formatoptions-=cro')
        vim.cmd('setlocal formatoptions-=cro')
      end
    },
  },

  -- open nvim-tree when vim is starting in a folder
  {
    events = { 'VimEnter' },
    opts = {
      callback = function(args)
        local file = args.file

        if vim.fn.isdirectory(args.file) == 1 then
          vim.cmd.enew()
          vim.cmd.bw(args.buf)
          vim.cmd.cd(file)

          require('nvim-tree.api').tree.open()
        end
      end,
    },
  },

  -- generate DirOpened event
  {
    events = { 'BufEnter' },
    opts = {
      nested = true,
      callback = function(args)
        local bufname = vim.api.nvim_buf_get_name(args.buf)
        if vim.fn.isdirectory(bufname) == 1 then
          vim.cmd('do User DirOpened')
        end
      end,
    },
  },

  -- generate FileOpened event
  {
    events = { 'BufRead', 'BufWinEnter', 'BufNewFile' },
    opts = {
      nested = true,
      callback = function(args)
        local buftype = vim.api.nvim_get_option_value('buftype', { buf = args.buf })
        if not (vim.fn.expand '%' == '' or buftype == 'nofile') then
          vim.cmd('do User FileOpened')
        end
      end,
    },
  },
}

for _, autocmd in pairs(autocmds) do
  vim.api.nvim_create_autocmd(autocmd.events, autocmd.opts)
end

