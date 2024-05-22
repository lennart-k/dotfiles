return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = "org",
  config = function()
    -- Setup treesitter
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      ensure_installed = { "org" },
    })

    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/Notes/**/*",
      org_default_notes_file = "~/Notes/refile.org",
    })

    -- require("cmp").setup({
    --   sources = {
    --     name = "orgmode",
    --   },
    -- })
  end,
}
