return {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup({
      create_dirs = true,
      perspective = {
        -- priority = "current", -- current  | first | root + perspective.root_tell
        fallback = 'first',
        nvim_wd_heel = false,
        update = false,
      },
      filetypes = { md = true, markdown = true },
      wrap = true,
      links = {
        implicit_extension = '',
        style = 'markdown',
        name_is_source = true,
        conceal = true,
        transform_explicit = function()
          return vim.fn.expand('%:p:h') .. '/' -- vim.fn.expand("%:h") -- vim.api.nvim_buf_get_name(0)
        end,
      },
      new_file_template = {
        use_template = false,
        placeholders = {
          before = {
            title = 'link_title',
            date = 'os_date',
          },
          after = {},
        },
        template = '# {{ title [date]}}',
      },
      mappings = {
        MkdnEnter = { { 'n', 'v' }, '<CR>' },
        MkdnTab = false,
        MkdnSTab = false,
        MkdnNextLink = { 'n', '<Tab>' },
        MkdnPrevLink = { 'n', '<S-Tab>' },
        MkdnNextHeading = { 'n', ']]' },
        MkdnPrevHeading = { 'n', '[[' },
        MkdnGoBack = { 'n', '<BS>' },
        MkdnGoForward = { 'n', '<Del>' },
        MkdnCreateLink = false, -- see MkdnEnter
        MkdnCreateLinkFromClipboard = { { 'n', 'v' }, '<leader>p' }, -- see MkdnEnter
        MkdnFollowLink = false, -- see MkdnEnter
        MkdnDestroyLink = { 'n', '<M-CR>' },
        MkdnTagSpan = { 'v', '<M-CR>' },
        MkdnMoveSource = { 'n', '<F3>' },
        MkdnYankAnchorLink = { 'n', 'yaa' },
        MkdnYankFileAnchorLink = { 'n', 'yfa' },
        MkdnIncreaseHeading = { 'n', '+' },
        MkdnDecreaseHeading = { 'n', '-' },
        MkdnToggleToDo = { { 'n', 'v' }, '<C-Space>' },
        MkdnNewListItem = false,
        MkdnNewListItemBelowInsert = { 'n', 'o' },
        MkdnNewListItemAboveInsert = { 'n', 'O' },
        MkdnExtendList = false,
        MkdnUpdateNumbering = { 'n', '<leader>nn' },
        MkdnTableNextCell = { 'i', '<Tab>' },
        MkdnTablePrevCell = { 'i', '<S-Tab>' },
        MkdnTableNextRow = false,
        MkdnTablePrevRow = { 'i', '<M-CR>' },
        MkdnTableNewRowBelow = { 'n', '<leader>ir' },
        MkdnTableNewRowAbove = { 'n', '<leader>iR' },
        MkdnTableNewColAfter = { 'n', '<leader>ic' },
        MkdnTableNewColBefore = { 'n', '<leader>iC' },
        MkdnFoldSection = { 'n', '<leader>f' },
        MkdnUnfoldSection = { 'n', '<leader>F' },
      },
    })
  end,
}
