require("nvim-treesitter.configs").setup({
  playground = { enable = false },
  query_linter = {
    enable = false,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  -- ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
  },
})
