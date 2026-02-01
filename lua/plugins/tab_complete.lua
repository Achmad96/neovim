return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- 1. Make the menu appear INSTANTLY (remove the default 60ms delay)
      opts.performance = {
        debounce = 0, -- default is 60ms
        throttle = 0, -- default is 30ms
      }

      -- 2. Ensure it triggers after typing just ONE character
      opts.completion = opts.completion or {}
      opts.completion.keyword_length = 1
    end,
  },
}
