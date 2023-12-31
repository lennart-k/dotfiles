return {
  {
    "nvarner/typst-lsp",
    opts = {
      exportPdf = "onType",
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       typst_lsp = {},
  --     },
  --   },
  -- },
  {
    "kaarmu/typst.vim",
    -- commit = "e4d0721",
    ft = "typst",
    lazy = false,
  },
}
