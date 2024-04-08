require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "typescript", "query", "c", "lua", "vim", "help", "jsdoc", "org" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = true, disable = { "javascript", "markdown", "org" } },
  --incremental_selection = { enable = true },
  --textobjects = { enable = true },
  playground = { enable = true },
}

require('orgmode').setup_ts_grammar()
