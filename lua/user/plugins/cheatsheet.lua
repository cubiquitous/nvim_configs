return {
  'sudormrfbin/cheatsheet.nvim',
  config = function()
    require('cheatsheet').setup({
      bundled_cheatsheets = {
        disabled = { 'unicode', 'markdown', 'regex' },
      },
      bundled_plugin_cheatsheets = false,
    })
  end,
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
  },
}
