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
          --- todo: these configuration from lspconfig may be broken
          single_file_support = true,
          -- root_dir = function()
          --   return vim.fn.getcwd()
          -- end,
          settings = {
            exportPdf = "onSave",
          },
        },
      },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
}
