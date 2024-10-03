return {
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = true,
    init = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      })
    end,
    keys = function()
      return {
        {
          "<C-h>",
          function()
            require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
          end,
          mode = { "i", "n", "v" },
        },
        {
          "<C-j>",
          function()
            require("nvim-tmux-navigation").NvimTmuxNavigateDown()
          end,
          mode = { "i", "n", "v" },
        },
        {
          "<C-k>",
          function()
            require("nvim-tmux-navigation").NvimTmuxNavigateUp()
          end,
          mode = { "i", "n", "v" },
        },
        {
          "<C-l>",
          function()
            require("nvim-tmux-navigation").NvimTmuxNavigateRight()
          end,
          mode = { "i", "n", "v" },
        },
        {
          "<C-\\>",
          function()
            require("nvim-tmux-navigation").NvimTmuxNavigateLastActive()
          end,
          mode = { "i", "n", "v" },
        },
        {
          "<C-Space>",
          function()
            require("nvim-tmux-navigation").NvimTmuxNavigateRight()
          end,
          mode = { "i", "n", "v" },
        },
      }
    end,
  },
}
