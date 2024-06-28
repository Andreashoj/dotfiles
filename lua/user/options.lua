lvim.icons.ui.Folder = "󰉋"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.default = lvim.icons.ui.Folder

lvim.builtin.dap.active = true
vim.opt.relativenumber = true

lvim.builtin.telescope = {
  active = true,
  defaults = {
    layout_strategy = "horizontal",
    path_display = { truncate = 2 }
  }
}

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.width = 45



lvim.log.level = "warn"
lvim.format_on_save = {
  pattern = "*.vue,*.js,*.ts,*.html,*.cjs,*.*.ts",
  enabled = true,
  timeout = 1000,
}

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "vue",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    -- exe = "eslint",
    -- exe = "prettier",
    exe = "prettierd",
    filetypes = {
      "html",
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "json",
      "markdown",
      "vue",
      "css",
      "less",
      "blade"
    },
  },
}
-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint",
    filetypes = {
      "javascriptreact",
      "typescript",
      "javascript",
      "html",
      "vue",
      "css",
      "less",
      "html",
    },
  },
}

