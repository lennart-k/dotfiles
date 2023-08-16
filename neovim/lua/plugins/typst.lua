return {
  {
    "nvarner/typst-lsp",
    ft = "typst",
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
    ft = "typst",
    lazy = false,
  },
}
