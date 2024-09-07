require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
map("n", "<leader>si", "<cmd>Telescope lsp_document_symbols<cr>")


map("n", "<leader>rc", ":lua require('ror.commands').list_commands()<cr>")
-- map("n", "<leader>rc", "<cmd>RorCommands<cr>")
map("n", "<leader>rt", "<cmd>RorTestRun<cr>")
map("n", "<leader>gs", "<cmd>Neogit<cr>")
