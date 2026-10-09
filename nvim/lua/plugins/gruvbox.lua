return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.opt.background = "light"
    vim.cmd("colorscheme gruvbox")
  end,
}
