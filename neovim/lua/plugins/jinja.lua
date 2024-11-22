return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jinja_lsp = {
          filetypes = { "jinja", "html" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".git")(fname)
          end,
          init_options = {
            templates = "./templates",
            -- backend = { "./src" },
            -- lang = "rust",
          },
        },
      },
    },
  },
}
