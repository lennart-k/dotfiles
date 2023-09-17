return {
  {
    "ThePrimeagen/harpoon",
    deps = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      require("harpoon").setup({
        tabline = true,
      })
    end,
  },
}
