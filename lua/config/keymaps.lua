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


-- 3. BUFFER MANAGEMENT
-- Often when people say "close tab" in generic editors, they mean "close file".
-- LazyVim default for this is <leader>bd (Buffer Delete).
-- You can map it to something simpler like <leader>x if you prefer:
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close Buffer/File" })
-- Pressing <leader>rs will source the current file
map("n", "<leader>rs", ":source %<CR>:echo 'Sourced current file!'<CR>")
-- Pressing <leader>tt will open a terminal
map("n", "<leader>tt", "<cmd>:terminal<cr>", { desc = "Open a Terminal" })
-- Custom keymap to send all open buffers to CopilotChat
map("n", "<leader>ab", function()
  local chat = require("CopilotChat")
  local bufs = vim.api.nvim_list_bufs()
  local context = {}
  for _, bufnr in ipairs(bufs) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
      local name = vim.api.nvim_buf_get_name(bufnr)
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      table.insert(context, "File: " .. name .. "\n\n" .. table.concat(lines, "\n"))
    end
  end

  local context_text = table.concat(context, "\n\n---\n\n")
  chat.ask("Based on the following code context:\n\n" .. context_text .. "\n\n[Your Question Here]")
end, { desc = "CopilotChat: Ask with all open buffers" })
