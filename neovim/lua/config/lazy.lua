local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- { "christoomey/vim-tmux-navigator", lazy = false },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.coding.luasnip" },
    -- "lazyvim.plugins.extras.lang.haskell",
    { import = "plugins" },


    -- Disable some unused plugins
    { "folke/noice.nvim", enabled = false },
    { "catppuccin/nvim", enabled = false },
    { "folke/tokyonight.nvim", enabled = false },
    { "nvim-mini/mini.indentscope", enabled = false },
    { "mason-org/mason.nvim", enabled = false },
    { "mason-org/mason-lspconfig.nvim", enabled = false },

    { "Shatur/neovim-ayu", lazy = false },
    -- {
    --   "mason-org/mason-lspconfig.nvim",
    --   opts = {},
    --   dependencies = {
    --     -- { "mason-org/mason.nvim", opts = {} },
    --     "neovim/nvim-lspconfig",
    --   },
    -- },
  },
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
  defaults = {
    lazy = true,
    version = "*",
  },
  install = { colorscheme = { "ayu" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
