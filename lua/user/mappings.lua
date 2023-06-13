local keymap = vim.keymap.set
local nmap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local function Opts(desc)
  return { unpack(opts), desc = desc }
end

keymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- [[   MOVEMENT   ]]
nmap('n', '<c-k>', ':wincmd k<CR>', { silent = true })
nmap('n', '<c-j>', ':wincmd j<CR>', { silent = true })
nmap('n', '<c-h>', ':wincmd h<CR>', { silent = true })
nmap('n', '<c-l>', ':wincmd l<CR>', { silent = true })
--
keymap('n', 'H', '^', { desc = 'R[^] go to start of the line' })
keymap('n', 'L', '$', { desc = 'R[$] go to end of line' })
keymap({ 'n', 'v' }, 'J', '%', { desc = 'R[%] jump between pairs' })
--
keymap('n', '<BS>', 'J', { desc = 'R[J] Join line with next' })
nmap('n', ',', '@@', { desc = 'R[@@] to execute Macro' })
--
keymap('n', '[d', vim.diagnostic.goto_prev, Opts('Go to Next Diagnostic'))
keymap('n', ']d', vim.diagnostic.goto_next, Opts('Go to Previous Diagnostic'))
--
keymap('n', '<F5>', '<cmd>:bprevious<cr>', Opts('move to next buffer'))
keymap('n', '<F6>', '<cmd>:bnext<cr>', Opts('move to previous buffer'))
--
keymap('n', '<C-p>', '<C-u>zz', Opts('R[+gg] centers '))
keymap('n', '<C-d>', '<C-d>zz', Opts('R[+gg] centers '))

-- [[   OTHER   ]]
keymap('n', '<c-cr>', 'i<CR>', { desc = 'insert new line at cursor' })
keymap('n', '<F4>', '<cmd>bd<cr>', Opts('Delete buffer'))
keymap('n', '<S-F4>', '<cmd>q<cr>', Opts('Close Vim'))
keymap('n', '<F2>', '<cmd>w<cr>', Opts('Save file'))
keymap({ 'n', 'i' }, 'çç', '<CR>', Opts('remap to <CR> when is pressed twice'))
--
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [   PLUGINS       ]
keymap('n', '<leader>e', '<cmd>Neotree toggle <cr>', opts) -- OK:

-- [[   Telescope       ]]
keymap('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
keymap('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
keymap('n', '<leader>k', require('telescope.builtin').keymaps, { desc = '[k] Shows all keymaps' })
keymap('n', '<leader>c', require('telescope.builtin').commands, { desc = '[c] Shows all commands' })
keymap('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
keymap('n', '<leader>ge', require('telescope.builtin').git_status, { desc = '[G]it [E]xplore' })

-- [[   LSP Saga       ]]
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { desc = 'show implementations and usages' })
keymap('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', { desc = '[g]o [p]ick definition' })
keymap({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = '[c]ode [a]ction' })
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", { desc = "hover doc [K]" })
keymap('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', { desc = '[s]how [l]ine diagnostics' })
keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', { desc = '[s]how [b]uffer diagnostics' })
keymap('n', '<leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>', { desc = '[s]how [w]orkspace diagnostics' })
keymap('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { desc = '[s]how [c]ursor diagnostics' })
keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', { desc = '[g]o [r]ename' })
keymap({ 'n', 't' }, '<A-t>', '<cmd>Lspsaga term_toggle<CR>', { desc = 'Floating terminal [A-t]' })
keymap('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
keymap('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')
