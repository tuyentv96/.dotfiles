
require("nvim-treesitter.configs").setup({
  playground = { enable = false },
  ensure_installed = {
      'rust',
      'go',
      'scala',
      'java',
      'python',
      'yaml',
      'lua',
      'json',
      'dockerfile',
      'c',
      'dart'
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
    additional_vim_regex_highlighting = {},
  },
  textobjects = { enable = false },
  incremental_selection = {
    enable = false,
  }
})
