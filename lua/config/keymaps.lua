-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- map("n", "<A-w>", function()
--   Snacks.bufdelete()
-- end, { desc = "Delete Buffer" })

-- map("n", "<A-w>", ":bd<CR>", { desc = "Delete Buffer" })
-- map("n", "<C-n>", "<cmd>enew<cr>", { desc = "New Empty Buffer" })

-- 1. TAB MANAGEMENT
-- Open a new empty tab
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })

-- Open the current file in a new tab (useful for focusing)
map("n", "<leader>tf", "<cmd>tab split<cr>", { desc = "Open Current Buffer in New Tab" })

-- Close the current tab
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- -- Switch between tabs
-- map("n", "<S-l>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<S-h>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })


-- 2. SPLIT MANAGEMENT (Windows)
-- Split window vertically (left/right)
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split Vertically" })

-- Split window horizontally (top/bottom)
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split Horizontally" })

-- Close the current split window
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close Split" })


-- 3. BUFFER MANAGEMENT (Optional but recommended)
-- Often when people say "close tab" in generic editors, they mean "close file".
-- LazyVim default for this is <leader>bd (Buffer Delete).
-- You can map it to something simpler like <leader>x if you prefer:
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close Buffer/File" })
-- Pressing <leader>rs will source the current file
map("n", "<leader>rs", ":source %<CR>:echo 'Sourced current file!'<CR>")
