return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open   = "",
            folder_empty  = "",
            default       = "",
            symlink       = "",
          },
          git_status = {
            added     = "✚",
            modified  = "",
            removed   = "✖",
            renamed   = "➜",
            untracked = "★",
            ignored   = "◌",
          },
        },
      })
    end,
  },
}
