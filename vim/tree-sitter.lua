local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.c' },
  },
  filetype = 'org',
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "typescript", "query", "c", "lua", "vim", "jsdoc", "org" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = true, disable = { "javascript", "markdown", "org" } },
  --incremental_selection = { enable = true },
  --textobjects = { enable = true },
  playground = { enable = true },
}
