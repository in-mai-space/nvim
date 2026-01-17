return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = "mason-org/mason.nvim",
    config = function()
      local none_ls = require("none-ls")
      none_ls.setup({
        sources = {
          -- Python
          none_ls.builtins.formatting.black,
          none_ls.builtins.formatting.isort,
          none_ls.builtins.diagnostics.flake8,

          -- TypeScript / JavaScript
          none_ls.builtins.formatting.prettier,
          none_ls.builtins.diagnostics.eslint_d,

          -- Go
          none_ls.builtins.formatting.gofmt,
          none_ls.builtins.diagnostics.golangci_lint,

          -- Shell
          none_ls.builtins.formatting.shfmt,
          none_ls.builtins.diagnostics.shellcheck,

          -- Lua
          none_ls.builtins.formatting.stylua,

          none_ls.builtins.formatting.prettier,
        },
      })
    end,
  },
}
