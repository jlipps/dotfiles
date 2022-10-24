require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "query" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = true, disable = { "javascript", "markdown" } },
  --incremental_selection = { enable = true },
  --textobjects = { enable = true },
  playgorund = { enable = true },
}
