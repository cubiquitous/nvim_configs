local keymap = vim.keymap.set
return {
  'glepnir/lspsaga.nvim',
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup({
      preview = {
        lines_above = 0,
        lines_below = 10,
      },
      scroll_preview = {
        scroll_down = '<C-f>',
        scroll_up = '<C-b>',
      },
      request_timeout = 2000,
      finder = {
        max_height = 0.5,
        min_width = 30,
        force_max_height = false,
        keys = {
          jump_to = 'p',
          expand_or_jump = 'o',
          vsplit = 's',
          split = 'i',
          tabe = 't',
          tabnew = 'r',
          quit = { 'q', '<ESC>' },
          close_in_preview = '<ESC>',
        },
      },
      definition = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
      },
      lightbulb = {
        enable = false,
      },
      hover = {
        max_width = 0.6,
        open_link = 'gx',
        open_browser = '!flatpak run org.mozilla.firefox',
      },
      diagnostic = {
        on_insert = false,
        on_insert_follow = false,
      },
      symbol_in_winbar = {
        enable = true,
        separator = '  ',
        ignore_patterns = {},
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
      },
    })
  end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    --Please make sure you install markdown and markdown_inline parser
    { 'nvim-treesitter/nvim-treesitter' },
  },
}
