return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.dashboard = opts.dashboard or {}
    opts.dashboard.preset = opts.dashboard.preset or {}

    opts.dashboard.preset.header = [[
]]

    opts.dashboard.preset.keys = {
      {
        icon = "󰱼 ",
        key = "f",
        desc = "Find File",
        action = ":lua Snacks.dashboard.pick('files', {hidden=true})",
      },
      {
        icon = "󰝒 ",
        key = "n",
        desc = "New File",
        action = ":ene | startinsert",
      },
      {
        icon = "󰤘 ",
        key = "r",
        desc = "Recent Files",
        action = ":lua Snacks.dashboard.pick('oldfiles')",
      },
    }

    opts.dashboard.sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
    }

    return opts
  end,
}
