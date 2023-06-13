return {
  'echasnovski/mini.nvim',
  config = function()
    local forEach = require('user.utils.loops').forEach
    local comment = {
      mappings = {
        comment = 'gc',
        comment_line = 'gc',
        textobject = 'gc',
      },
    }
    local selections = { pairs = {}, ai = {}, surround = {}, comment = comment }
    forEach(selections, function(k, v)
      require('mini.' .. k).setup(v)
    end)
  end,
}
