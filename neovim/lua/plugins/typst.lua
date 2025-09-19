return {
  -- requires tinymist
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
    },
  },
  -- add tinymist to lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        tinymist = {
          --- todo: these configuration from lspconfig maybe broken
          single_file_support = true,
          root_dir = function()
            return vim.fn.getcwd()
          end,
          settings = {
            exportPdf = "onSave",
          },
        },
      },
    },
  },
}

-- return {
--   -- {
--   --   "nvarner/typst-lsp",
--   --   opts = {
--   --     exportPdf = "onType",
--   --   },
--   -- },
--   -- {
--   --   "neovim/nvim-lspconfig",
--   --   opts = {
--   --     servers = {
--   --       typst_lsp = {},
--   --     },
--   --   },
--   -- },
--   {
--     "kaarmu/typst.vim",
--     -- commit = "e4d0721",
--     ft = "typst",
--     lazy = false,
--   },
--   {}
-- }
