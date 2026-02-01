return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  opts = {
    -- Appearance
    win_opts = {
      relative = "editor",
      anchor = "SE",           -- SE (South East), SW (South West), NE, NW
      row = vim.o.lines - 3,   -- Offset from the bottom
      col = vim.o.columns - 2, -- Offset from the right
      width = 30,
      height = 1,
      border = "rounded", -- "single", "double", "rounded", "solid", "shadow"
    },

    -- Behavior
    compress_after = 3, -- Turns "kkk" into "3k"
    clear_after = 3,    -- Auto-hide after 3 seconds of silence

    -- Formatting
    show_leader = true,    -- Shows "<leader>" instead of the actual key (e.g., Space)
    group_mappings = true, -- Groups things like <leader>fg into one display unit
  },
  config = function(_, opts)
    require("screenkey").setup(opts)
    -- This line triggers it to start immediately
    vim.cmd("Screenkey")
  end,
}
