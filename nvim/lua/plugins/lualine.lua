return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "gruvbox", -- Встроенная тема Gruvbox
      icons_enabled = false,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
      disabled_filetypes = {
        statusline = {
          "snacks_dashboard",
          "dashboard",
          "alpha",
          "startify",
          "help",
          "lazy",
          "mason",
          "qf",
          "Trouble",
          "NvimTree",
          "neo-tree",
          "Outline",
          "terminal",
        },
        winbar = {},
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(s)
            return s:sub(1, 3)
          end,
          padding = { left = 1, right = 1 },
          color = { gui = "bold" },
        },
      },
      lualine_b = {
        {
          "filetype",
          icon_only = false,
          colored = false,
          padding = { left = 1, right = 1 },
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,
          symbols = { modified = " ● ", readonly = "  " },
          cond = function()
            return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
          end,
        },
      },
      lualine_x = {
        {
          "diagnostics",
          padding = { left = 1, right = 1 },
        },
        {
          "diff",
          padding = { left = 1, right = 1 },
        },
        {
          "branch",
          icon = " ",
          padding = { left = 1, right = 1 },
        },
      },
      lualine_y = {
        {
          "progress",
          padding = { left = 1, right = 1 },
        },
      },
      lualine_z = {
        {
          "location",
          padding = { left = 1, right = 1 },
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { { "location", padding = { left = 1, right = 1 } } },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
