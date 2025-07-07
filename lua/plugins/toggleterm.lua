return {
   -- Easily toggle floating terminal
   {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = function()
         require("toggleterm").setup {
            open_mapping = [[<c-\>]],
            direction = 'float',
         }
      end
   },
}
