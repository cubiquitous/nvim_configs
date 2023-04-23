local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function AddDescToOpts(desc)
	return { unpack(opts), desc = desc }
end
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ "n", "v" }, "<Space>", "<Nop>", opts)
map({ "n" }, "<c-h>", "<Cmd>wincmd h<CR>", opts)
map({ "n" }, "<c-j>", "<Cmd>wincmd j<CR>", opts)
map({ "n" }, "<c-k>", "<Cmd>wincmd k<CR>", opts)
map({ "n" }, "<c-l>", "<Cmd>wincmd l<CR>", opts)

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<leader>e", "<cmd>Neotree toggle <cr>", opts)
map("n", "<leader>w", "<cmd>w<cr>", opts)
-- closes buffer
map("n", "<leader>d", "<cmd>bd<cr>", opts)

-- See `:help telescope.builtin`
map("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
map("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
map("n", "<leader>k", require("telescope.builtin").keymaps, { desc = "[k] Shows all keymaps" })
map("n", "<leader>c", require("telescope.builtin").commands, { desc = "[c] Shows all keymaps" })
map("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>ld", vim.diagnostic.open_float)
map("n", "<leader>q", vim.diagnostic.setloclist)

-- search and replace global
map("n", "S", ":%s///gc<left><left><left><left>", { desc = "Replace cursor all", noremap = true, silent = false })

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
map({ "n", "i" }, "ç", "<CR>", { noremap = true, silent = true })

-- CONFIG FOR TERMTOGGLE
function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
local Terminal = require("toggleterm.terminal").Terminal

--LAZYGIT
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
--
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
map("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", AddDescToOpts("Toggle Lazygit"))

-- LIVE_SERVER
local live_server = Terminal:new({ cmd = "live-server", hidden = true })

function _LIVE_SERVER_TOGGLE()
	live_server:toggle()
end

map("n", "<leader>tl", "<cmd> lua _LIVE_SERVER_TOGGLE()<cr>", AddDescToOpts("Open Live Server"))
