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
map("n", "<A-c>", "<cmd>bd<cr>", opts)
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

--
map({ "n", "i" }, "ç", "<CR>", { noremap = true, silent = true })
