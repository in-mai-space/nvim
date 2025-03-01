return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = opts.sources or {} -- Ensure opts.sources is initialized
      table.insert(opts.sources, null_ls.builtins.formatting.latexindent)
    end,
  },
}
