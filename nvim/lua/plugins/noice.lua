return {
  "folke/noice.nvim",
  opts = {
    views = {
      cmdline_popup = {
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder",
          },
        },
      },
      cmdline_popupmenu = {
        win_options = {
          winhighlight = {
            Normal = "Pmenu",
            FloatBorder = "Pmenu",
            CursorLine = "PmenuSel",
          },
        },
      },
    },
  },
}
