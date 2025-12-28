return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>sf",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart find files"
    }
  },
  config = function()
    Snacks.scroll.disable()
  end
}
