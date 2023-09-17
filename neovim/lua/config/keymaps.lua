-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

if Util.has("bufferline.nvim") then
  map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
end

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

map("n", "<leader>h", harpoon_mark.toggle_file, { desc = "Toggle file Harpoonification" })
map("n", "<C-e>", function()
  harpoon_ui.toggle_quick_menu()
  for i = 1, 9 do
    vim.api.nvim_buf_set_keymap(
      Harpoon_bufh,
      "n",
      string.format("%d", i),
      string.format("<Cmd>lua require('harpoon.ui').nav_file(%d)<CR>", i),
      { silent = true }
    )
  end
end, { desc = "Toggle Harpoon" })
