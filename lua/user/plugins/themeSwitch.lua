return {
  {
    "nishu-murmu/ThemeSwitch.nvim",
    event = "BufReadPre",
    config = function()
      require("ThemeSwitch").setup()
    end
  }
}
