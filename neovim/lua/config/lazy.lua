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
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "ayu" } },
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { "christoomey/vim-tmux-navigator", lazy = false },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.go" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { "folke/noice.nvim", enabled = false },
    { "echasnovski/mini.indentscope", enabled = false },
    {
      "nvim-treesitter/nvim-treesitter",
      init = function()
        require("nvim-treesitter.parsers").get_parser_configs().typst = {
          install_info = {
            url = "https://github.com/uben0/tree-sitter-typst.git",
            files = { "src/parser.c", "src/scanner.c" },
            branch = "v0.8.0-2",
          },
          filetype = "typ",
        }
      end,
    },
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
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
