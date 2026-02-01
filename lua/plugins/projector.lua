return {
  {
    "kndndrj/nvim-projector",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim", -- Ensure Telescope is present
    },
    event = "VeryLazy",
    config = function()
      local projector = require("projector")

      -- 1. Setup Projector
      projector.setup({
        loaders = { require("projector.loaders").BuiltinLoader:new() },
        outputs = { require("projector.outputs").TaskOutputBuilder:new() },
        dashboard = {},
        config = {},
        core = {},
      })

      -- 2. Load Telescope Extension Safely
      -- This pcall ensures that if the extension isn't ready yet, it skips it instead of erroring
      local status, telescope = pcall(require, "telescope")
      if status then
        pcall(telescope.load_extension, "projector")
      end
    end,

    -- 3. Keymaps
    keys = {
      {
        "<leader>pp",
        function()
          require("projector").next()
        end,
        desc = "Next Task",
      },
      {
        "<leader>pP",
        function()
          require("projector").previous()
        end,
        desc = "Prev Task",
      },
      {
        "<leader>pt",
        function()
          require("telescope").extensions.projector.projector()
        end,
        desc = "Select Task (Telescope)",
      },
      {
        "<leader>pr",
        function()
          require("projector").restart()
        end,
        desc = "Restart Task",
      },
    },
  },
}
