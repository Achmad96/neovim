return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      -- model = "claude-sonnet-4.5",
      model = "claude-haiku-4.5",
      -- model = "gpt-4o",
      -- model = "gemini-1.5-pro",
      -- Show help and prompts in a floating window/split
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.4,
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.cmd("highlight link markdownError NONE")
        end,
      })
    end,
    keys = {
      -- Toggle chat window
      {
        "<leader>aa",
        "<cmd>CopilotChatToggle<cr>",
        mode = { "n" },
        desc = "CopilotChat - Toggle",
      },

      -- Save the current chat history with a custom name
      {
        "<leader>as",
        function()
          local name = vim.fn.input("Save Chat Name: ")
          if name ~= "" then
            vim.cmd("CopilotChatSave " .. name)
          end
        end,
        desc = "CopilotChat - Save History",
      },

      -- Load a saved chat history
      {
        "<leader>al",
        function()
          -- This opens the history folder and lets you pick a file
          local history_path = vim.fn.stdpath("data") .. "/copilotchat_history"
          -- Check if directory exists
          if vim.fn.isdirectory(history_path) == 0 then
            print("No history found")
            return
          end
          -- Use Neovim's built-in select menu to pick a file
          local files = vim.fn.readdir(history_path)
          vim.ui.select(files, { prompt = "Select Chat History:" }, function(selected)
            if selected then
              vim.cmd("CopilotChatLoad " .. selected:gsub("%.json$", ""))
            end
          end)
        end,
        desc = "CopilotChat - Browse History",
      },

      -- Clear the current chat history
      {
        "<leader>ax",
        "<cmd>CopilotChatReset<cr>",
        mode = { "n" },
        desc = "CopilotChat - Reset",
      },

      -- Generate a commit message for the current changes
      {
        "<leader>am",
        "<cmd>CopilotChatCommit<cr>",
        mode = { "n" },
        desc = "CopilotChat - Generate Commit Message",
      },

      -- Custom prompt: Explain the selected code
      {
        "<leader>ae",
        "<cmd>CopilotChatExplain<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Explain Code",
      },

      -- Optimize codes
      {
        "<leader>ao",
        "<cmd>CopilotChatOptimize<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Optimize Code",
      },

      -- Fix codes
      {
        "<leader>af",
        "<cmd>CopilotChatFix<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Fix Code",
      },

      -- Generate Test codes
      {
        "<leader>at",
        "<cmd>CopilotChatTests<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Generate Tests",
      },

      -- Generate Documentation
      {
        "<leader>ad",
        "<cmd>CopilotChatDocs<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Write Documentation",
      },

      -- Review the current code and suggest improvements
      {
        "<leader>ar",
        "<cmd>CopilotChatReview<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Review Code",
      },

      -- Quick Chat (opens a prompt input)
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, {
              -- The modern way: provide the selection helper directly
              selection = require("CopilotChat.#select").buffer,
            })
          end
        end,
        desc = "CopilotChat - Quick Chat",
      },

    },
  },
}
