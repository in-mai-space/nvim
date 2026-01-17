return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.indentscope").setup()
      require("mini.pairs").setup()
      require("mini.comment").setup()
    end,
  },
}
