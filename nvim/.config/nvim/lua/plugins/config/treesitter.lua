require("nvim-treesitter.configs").setup({
  playground = { enable = false },
  ensure_installed = {
      'rust',
      'go',
      'scala',
      'python',
      'yaml',
      'lua',
      'json'
  },
  indent = {
    enable = false,
  },
  query_linter = {
    enable = false,
    use_virtual_text = false,
  },
  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
  },
  textobjects = { enable = false },
  incremental_selection = {
    enable = false,
  }
})
