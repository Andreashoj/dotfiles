--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- LOGO 
require("luasnip.loaders.from_lua").load({paths = "~/snippets"})

lvim.builtin.alpha.dashboard.section.header.val = {
  "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗   ",
  "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║   ",
  "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   ",
  "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║   ",
  "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║   ",
  "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝   ",
  "     ██████╗ ██╗   ██╗     █████╗ ███╗   ██╗███████╗      ",
  "     ██╔══██╗╚██╗ ██╔╝    ██╔══██╗████╗  ██║╚══███╔╝      ",
  "     ███████╔╝ ╚████╔╝    ███████║██╔██╗ ██║  ███╔╝       ",
  "     ██╔══██╗  ╚██╔╝      ██╔══██║██║╚██╗██║ ███╔╝        ",
  "     ███████╔╝  ██║       ██║  ██║██║ ╚████║███████╗     ",
  "     ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝     ",
}

-- general
lvim.log.level = "warn"
lvim.format_on_save = {
  pattern = "*.vue,*.js,*.ts,*.html,*.cjs,*.*.ts",
  enabled = true,
  timeout = 1000,
}

lvim.colorscheme = "lunar"

vim.opt.relativenumber = true
-- to isable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-t>"] = ":TroubleToggle<CR>"
lvim.keys.normal_mode["<C-t>"] = ":Trouble<CR>"
lvim.keys.normal_mode["<C-b>"] = ":GitMessenger<CR>"
lvim.keys.normal_mode["<Leader>bo"] = ':%bd!|e #|bd #|normal`"<CR>'
lvim.keys.normal_mode["F"] = ":HopChar2<CR>"
lvim.keys.normal_mode["f"] = ":HopChar1CurrentLine<CR>"
lvim.keys.normal_mode["<Leader>gB"] = ":ls<cr>:buffer<space>"

lvim.keys.normal_mode["<Leader>gf"] = ":CellularAutomaton make_it_rain<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Harppon
lvim.keys.normal_mode["<leader>a"] = ":lua require(\"harpoon.mark\").add_file()<CR>"
lvim.keys.normal_mode["<leader>H"] = ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>"

lvim.keys.normal_mode["<leader>1"] = ":lua require(\"harpoon.ui\").nav_file(1)<CR>"
lvim.keys.normal_mode["<leader>2"] = ":lua require(\"harpoon.ui\").nav_file(2)<CR>"
lvim.keys.normal_mode["<leader>3"] = ":lua require(\"harpoon.ui\").nav_file(3)<CR>"
lvim.keys.normal_mode["<leader>4"] = ":lua require(\"harpoon.ui\").nav_file(4)<CR>"

vim.keymap.set("n", "<leader>ct", "", {
	noremap = true,
	silent = true,
	callback = function()
		newtag = vim.fn.input("Enter new tag name: ")
		local return_position = vim.api.nvim_win_get_cursor(0)

		vim.cmd([[execute "normal T<"]])

		-- check if the character is slash
		-- i.e. if it is a closing tag
		-- and if yes, move the cursor to the opening tag
		-- I dunno why, but it just works better when we change the opening tag first
		local col = vim.api.nvim_win_get_cursor(0)[2]
		local char = vim.api.nvim_get_current_line():sub(col + 1, col + 1)

		if char == "/" then
			vim.cmd([[execute "normal %"]])
		end

		-- store the current cursor position
		local current_position = vim.api.nvim_win_get_cursor(0)

		-- go to the closing tab and move one character to the right, so that we can change the tag name
		vim.cmd([[execute "normal %l"]])

		vim.cmd('execute "normal \\"_ciw' .. newtag .. '"')

		-- go to current_position
		vim.api.nvim_win_set_cursor(0, current_position)

		-- change this tag as well
		vim.cmd('execute "normal \\"_ciw' .. newtag .. '"')

		-- return to return_position
		vim.api.nvim_win_set_cursor(0, return_position)
	end
})

lvim.icons.ui.Folder = "󰉋"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.default = lvim.icons.ui.Folder

lvim.plugins = {
  -- {'neoclide/coc.nvim'},
  -- {
  --   'AckslD/muren.nvim',
  --   config = true,
  -- },
  { 'eandrju/cellular-automaton.nvim' },
  { 'SirVer/ultisnips' },
  { 'honza/vim-snippets' },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
    require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false }
      })
    end
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  { 'rhysd/git-messenger.vim' },
  {
   "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { 'ThePrimeagen/harpoon' },
  { 'tpope/vim-surround' },
  { 'jwalton512/vim-blade' },
  { 
    'theHamsta/nvim-dap-virtual-text'
  },
  {
  "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    config = true,
  },
  {
    'windwp/nvim-ts-autotag',
  }
}

lvim.builtin.dap.active = true

local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/andreashoj/Documents/projects/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
  }
}

require("lvim.lsp.manager").setup("angularls")

-- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "intelephense" })
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "phpactor"
end, lvim.lsp.automatic_configuration.skipped_servers)
-- lvim.lsp.

-- Below config is required to prevent copilot overriding Tab with a suggestion
-- when you're just trying to indent!
local has_words_before = function()
if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
local line, col = unpack(vim.api.nvim_win_get_cursor(0))
return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end
local on_tab = vim.schedule_wrap(function(fallback)
local cmp = require("cmp")
if cmp.visible() and has_words_before() then
cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
else
fallback()
end
end)
lvim.builtin.cmp.mapping["<Tab>"] = on_tab

-- telescope 

lvim.builtin.telescope = {
  active = true,
  defaults = {
    layout_strategy = "horizontal",
    path_display = { truncate = 2 }
  }
}

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.width = 45


-- if you don't want all the parsers change this to a table of the ones you want
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

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "eslint",
    -- exe = "prettier",
    -- exe = "prettierd",
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
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
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

require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})
