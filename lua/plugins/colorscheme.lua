-- return {
--   {
--     "Shatur/neovim-ayu",
--     name = "ayu",    -- Optional: helps lazy find the module, but explicit config is better
--     lazy = false,    -- Make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- Load before all other start plugins
--     config = function()
--       -- 1. Configure the theme options FIRST
--       require("ayu").setup({
--         mirage = true,  -- Set to true for the "Mirage" version (darker than dark)
--         overrides = {}, -- Your custom overrides
--       })
--
--       -- 2. Actually load the colorscheme
--       vim.cmd.colorscheme("ayu")
--     end,
--   },
--
--   -- If you are using LazyVim, you might also need to tell LazyVim
--   -- to stop trying to load its default 'tokyonight'
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "ayu",
--     },
--   },
-- }

return {
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 2,
    opts = {}, -- Optional
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "jellybeans-mono",
    },
  },
}
