-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("user/plugins")
require("user/settings")

-- Turn on lsp status information
require("fidget").setup()

require("user/lsp")
require("user/cmp")
require("user/mappings")
require("user/others")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
