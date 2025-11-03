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
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>tp", function()
              client:exec_cmd({
                title = "pin",
                command = "tinymist.pinMain",

                arguments = { vim.api.nvim_buf_get_name(0) },
              }, { bufnr = bufnr })
            end, { desc = "[T]inymist [P]in", noremap = true })

            vim.keymap.set("n", "<leader>tu", function()
              client:exec_cmd({
                title = "unpin",
                command = "tinymist.pinMain",

                arguments = { vim.v.null },
              }, { bufnr = bufnr })
            end, { desc = "[T]inymist [U]npin", noremap = true })
          end,
        },
      },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    dependencies = {
      "mason.nvim",
    },
    opts = {
      dependencies_bin = {
        ["tinymist"] = "/home/lennart/.local/share/nvim/mason/bin/tinymist",
      },
    },
  },
}
