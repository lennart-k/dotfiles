-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.version().major > 0 or vim.version().minor >= 9 then
  require("config.lazy")
end
