local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ========================
-- Leader Key
-- ========================
vim.g.mapleader = " " -- Space as leader

-- ========================
-- File & Buffer Navigation
-- ========================
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)       -- Find files
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)       -- Search text in files
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)         -- List open buffers
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)       -- Help tags
map("n", "<leader>fn", "<cmd>enew<CR>", opts)                      -- New empty buffer
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts)                   -- Close buffer
map("n", "<leader>bn", "<cmd>bnext<CR>", opts)                     -- Next buffer
map("n", "<leader>bp", "<cmd>bprevious<CR>", opts)                 -- Previous buffer
map("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- ========================
-- Window & Tab Management
-- ========================
map("n", "<leader>sv", "<cmd>vsplit<CR>", opts)                    -- Vertical split
map("n", "<leader>sh", "<cmd>split<CR>", opts)                     -- Horizontal split
map("n", "<leader>sc", "<cmd>close<CR>", opts)                     -- Close current window
map("n", "<leader>so", "<cmd>only<CR>", opts)                      -- Close other windows
map("n", "<leader>tn", "<cmd>tabnew<CR>", opts)                    -- New tab
map("n", "<leader>to", "<cmd>tabclose<CR>", opts)                  -- Close tab
map("n", "<leader>tN", "<cmd>tabnext<CR>", opts)                   -- Next tab
map("n", "<leader>tP", "<cmd>tabprevious<CR>", opts)               -- Previous tab

-- ========================
-- Window Movement
-- ========================
map("n", "<C-h>", "<C-w>h", opts)                                   -- Move left
map("n", "<C-j>", "<C-w>j", opts)                                   -- Move down
map("n", "<C-k>", "<C-w>k", opts)                                   -- Move up
map("n", "<C-l>", "<C-w>l", opts)                                   -- Move right

-- ========================
-- LSP / Code Actions
-- ========================
map("n", "gd", vim.lsp.buf.definition, opts)                        -- Go to definition
map("n", "gD", vim.lsp.buf.declaration, opts)                       -- Go to declaration
map("n", "gr", vim.lsp.buf.references, opts)                        -- References
map("n", "gi", vim.lsp.buf.implementation, opts)                    -- Implementation
map("n", "<leader>rn", vim.lsp.buf.rename, opts)                    -- Rename
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)               -- Code action
map("n", "<leader>co", function()                                     -- Organize TS imports
  vim.lsp.buf.execute_command({ command = "_typescript.organizeImports" })
end, opts)
map("n", "<leader>f", function()                                     -- Format buffer
  vim.lsp.buf.format({ async = true })
end, opts)

-- ========================
-- Git (requires gitsigns.nvim)
-- ========================
map("n", "<leader>gs", ":Gitsigns toggle_signs<CR>", opts)          -- Toggle git signs
map("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)              -- Git diff current file
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)            -- Blame current line
map("n", "<leader>gc", ":Gitsigns commit<CR>", opts)                -- Commit

-- ========================
-- Terminal / REPL
-- ========================
map("n", "<leader>tt", ":ToggleTerm<CR>", opts)                     -- Toggle terminal
map("n", "<leader>tv", ":vsplit | terminal<CR>", opts)              -- Vertical terminal
map("n", "<leader>th", ":split | terminal<CR>", opts)               -- Horizontal terminal

-- ========================
-- Markdown / LaTeX Preview
-- ========================
map("n", "<leader>mp", ":MarkdownPreview<CR>", opts)                -- Markdown preview
map("n", "<leader>lp", ":!latexmk -pdf %<CR>", opts)                -- Compile LaTeX
map("n", "<leader>lv", ":!open %:r.pdf<CR>", opts)                  -- View PDF (macOS)
map("n", "<leader>lc", ":!latexmk -c<CR>", opts)                    -- Clean LaTeX aux files

-- ========================
-- Misc / Quality-of-Life
-- ========================
map("i", "jj", "<Esc>", opts)                                       -- Quick escape insert mode
map("i", "jk", "<Esc>", opts)                                       -- Quick escape insert mode
map("n", "<leader>u", ":UndotreeToggle<CR>", opts)                  -- Toggle undo tree
map("n", "<leader>s", ":setlocal spell!<CR>", opts)                 -- Toggle spell check
