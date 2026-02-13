local logos = require("config.logos")
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = logos.header4
        }
      }
    },
  }
}
