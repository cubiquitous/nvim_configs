local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function AddDescToOpts(desc)
	return { unpack(opts), desc = desc }
end
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap({ "n", "v" }, "<Space>", "<Nop>", opts)
keymap({ "n" }, "<c-h>", "<Cmd>wincmd h<CR>", opts)
keymap({ "n" }, "<c-j>", "<Cmd>wincmd j<CR>", opts)
keymap({ "n" }, "<c-k>", "<Cmd>wincmd k<CR>", opts)
keymap({ "n" }, "<c-l>", "<Cmd>wincmd l<CR>", opts)

keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap("n", "<A-c>", "<cmd>bd<cr>", opts)

keymap("n", "<leader>e", "<cmd>Neotree toggle <cr>", opts)
keymap("n", "<leader>w", "<cmd>w<cr>", opts)
-- closes buffer
-- See `:help telescope.builtin`

keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<leader>ld", vim.diagnostic.open_float)
keymap("n", "<leader>q", vim.diagnostic.setloclist)

keymap("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
keymap("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
keymap("n", "<leader>k", require("telescope.builtin").keymaps, { desc = "[k] Shows all keymaps" })
keymap("n", "<leader>c", require("telescope.builtin").commands, { desc = "[c] Shows all keymaps" })
keymap("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
keymap("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- search and replace global
keymap("n", "S", ":%s///gc<left><left><left><left>", { desc = "Replace cursor all", noremap = true, silent = false })

--
keymap({ "n", "i" }, "ç", "<CR>", { noremap = true, silent = true })
