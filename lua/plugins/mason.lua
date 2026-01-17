return {
  -- Mason package manager
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",        -- Python LSP
        "black",          -- Python formatter
        "isort",          -- Python import sorter
        "flake8",         -- Python linter
        "tsserver",       -- TypeScript/JS LSP
        "eslint_d",       -- TypeScript/JS linter
        "prettier",       -- TypeScript/JS/Markdown formatter
        "gopls",          -- Go LSP
        "golangci-lint",  -- Go linter
        "gofmt",          -- Go formatter
        "stylua",         -- Lua formatter
        "shellcheck",     -- Shell script linter
        "shfmt",          -- Shell script formatter
        "marksman",       -- Markdown LSP
      },
    },
  },

  -- Mason LSPConfig integration
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = "mason-org/mason.nvim",
    config = true,
  },

  -- LSP configuration for all languages
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")

      -- List of servers to attach
      local servers = {
        pyright = {},
        tsserver = {},
        gopls = {
          settings = {
            gopls = {
              analyses = { unusedparams = true, shadow = true },
              staticcheck = true,
            },
          },
        },
        marksman = {},
      }

      -- Setup all servers
      for server, opts in pairs(servers) do
        lspconfig[server].setup({
          on_attach = function(client, bufnr)
            local opts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
          end,
          settings = opts.settings,
        })
      end

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,   -- inline error messages
        signs = true,          -- gutter icons
        underline = true,      -- underline problematic code
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },

  -- Null-ls for formatters & linters
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

          -- JS/TS
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint_d,

          -- Go
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.diagnostics.golangci_lint,

          -- Lua
          null_ls.builtins.formatting.stylua,

          -- Shell
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.formatting.shfmt,
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
