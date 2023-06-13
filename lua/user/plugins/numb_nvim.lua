-- line picker. ex `:18` will show line 18 without moving the cursor`
return {
  'nacro90/numb.nvim',
  config = function()
    require('numb').setup()
  end,
}
