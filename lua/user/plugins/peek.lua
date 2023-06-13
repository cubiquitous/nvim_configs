return {
  'toppair/peek.nvim', -- works after running ` deno task build:debug ` inside folder
  build = 'deno task --quiet build:fast',
  ft = 'markdown',

  config = function()
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    require('peek').setup({
      theme = 'light',
      app = {
        'flatpak',
        'run',
        'org.mozilla.firefox',
        '--new-window',
      },
      auto_load = true, -- whether to automatically load preview when
      close_on_bdelete = true, -- close preview window on buffer delete
      syntax = true, -- enable syntax highlighting, affects performance
      update_on_change = true,
      filetype = { 'markdown' }, -- list of filetypes to recognize as markdown
      throttle_at = 200000, -- start throttling when file exceeds this
      throttle_time = 'auto', -- minimum amount of time in milliseconds
    })
  end,
}
