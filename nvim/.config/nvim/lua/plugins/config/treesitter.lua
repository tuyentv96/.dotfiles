local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require("nvim-treesitter.configs").setup({
  playground = { enable = false },
  ensure_installed = {
      'rust',
      'go',
      'scala',
      'python',
      'yaml',
      'lua',
      'json',
      'org',
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
