return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    deps = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>h",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<C-e>",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
            -- if harpoon.ui.win_id == nil then
            --   return
            -- end
            -- for i = 1, 9 do
            --   vim.api.nvim_buf_set_keymap(harpoon.ui.bufnr, "n", string.format("%d", i), "", {
            --     -- silent = true,
            --     noremap = true,
            --     callback = function() end,
            --   })
            -- end
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
}
