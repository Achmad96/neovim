return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      },
      clangd = {
        keys = {
          { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C++)" },
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "Build.GN",
            ".git"
          )(fname) or vim.fs.dirname(fname)
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          -- Fixes the 'invalid boolean' error in your log
          "--function-arg-placeholders=true",
          "--fallback-style=llvm",
          -- Tell clangd EXACTLY where your MinGW compiler is
          -- Replace the paths below with your actual MinGW bin folders
          "--query-driver=C:\\msys64\\ucrt64\\bin\\*,C:\\mingw64\\bin\\*",
        },
        -- cmd = {
        --   "clangd",
        --   "--background-index",
        --   "--clang-tidy",
        --   "--header-insertion=iwyu",
        --   "--completion-style=detailed",
        --   "--function-arg-placeholders",
        --   "--fallback-style=llvm",
        --   "--query-driver=C:\\msys64\\ucrt64\\bin\\*"
        -- },
      },
    },
  },
}
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         lua_ls = {
--           settings = {
--             Lua = {
--               diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { "vim" },
--               },
--               workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--                 checkThirdParty = false,
--               },
--               telemetry = { enable = false },
--             },
--           },
--         },
--         clangd = {
--           keys = {
--             { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C++)" },
--           },
--           root_dir = function(fname)
--             return require("lspconfig.util").root_pattern(
--               "Makefile",
--               "configure.ac",
--               "configure.in",
--               "config.h.in",
--               "Build.GN",
--               ".git"
--             )(fname) or vim.fs.dirname(fname)
--           end,
--           capabilities = {
--             offsetEncoding = { "utf-16" },
--           },
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--header-insertion=iwyu",
--             "--completion-style=detailed",
--             "--function-arg-placeholders",
--             "--fallback-style=llvm",
--             "--query-driver=C:\\msys64\\ucrt64\\bin\\g++.exe",
--           },
--         },
--       },
--     },
--   },
-- }
