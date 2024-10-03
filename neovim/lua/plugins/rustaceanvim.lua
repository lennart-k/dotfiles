return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>cR", function()
          vim.cmd.RustLsp("codeAction")
        end, { desc = "Code Action", buffer = bufnr })
        vim.keymap.set("n", "<leader>dr", function()
          vim.cmd.RustLsp("debuggables")
        end, { desc = "Rust Debuggables", buffer = bufnr })
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          -- Add clippy lints for Rust.
          checkOnSave = true,
          diagnostics = {
            disabled = { "unresolved-proc-macro" },
          },
          procMacro = {
            enable = true,
            -- ignored = {
            --   ["async-trait"] = { "async_trait" },
            --   ["napi-derive"] = { "napi" },
            --   ["async-recursion"] = { "async_recursion" },
            -- },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    if vim.fn.executable("rust-analyzer") == 0 then
      LazyVim.error(
        "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
        { title = "rustaceanvim" }
      )
    end
  end,
}
-- return {
--   "mrcjkb/rustaceanvim",
--   version = "^3",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     -- "mfussenegger/nvim-dap",
--     {
--       "lvimuser/lsp-inlayhints.nvim",
--       opts = {},
--     },
--   },
--   ft = { "rust" },
--   config = function()
--     vim.g.rustaceanvim = {
--       inlay_hints = {
--         highlight = "NonText",
--       },
--       tools = {
--         hover_actions = {
--           auto_focus = true,
--         },
--       },
--       server = {
--         on_attach = function(client, bufnr)
--           require("lsp-inlayhints").on_attach(client, bufnr)
--           require("lsp-inlayhints").show()
--         end,
--       },
--     }
--   end,
-- }
