local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "Shatur/neovim-ayu", lazy = false },
    { "chrisbra/Recover.vim", lazy = false },
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- { "christoomey/vim-tmux-navigator", lazy = false },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.coding.luasnip" },
    { "folke/noice.nvim", enabled = false },
    { "catppucin/nvim", enabled = false },
    { "folke/tokyonight", enabled = false },
    { "echasnovski/mini.indentscope", enabled = false },
    { import = "plugins" },
  },
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
