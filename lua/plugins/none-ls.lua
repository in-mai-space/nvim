return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = "mason-org/mason.nvim",
    config = function()
      local null_ls = require("none-ls")

      null_ls.setup({
        sources = {
          -- Python
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.diagnostics.flake8,

          -- TypeScript / JavaScript
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint_d,

          -- Go using revive
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.diagnostics.revive,

          -- Shell
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.diagnostics.shellcheck,

          -- Lua
          null_ls.builtins.formatting.stylua,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
              buffer = bufnr,
              callback = function() vim.lsp.buf.format({ async = false }) end,
            })
          end
        end,
      })
    end,
  },
}
