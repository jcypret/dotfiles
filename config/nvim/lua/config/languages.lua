local g = vim.g

-- html
vim.g.html_indent_tags = "li\\|p"

-- python
g.python3_host_prog = "$HOME/.asdf/shims/python3"
g.python_host_prog = "$HOME/.asdf/shims/python2"

g.python_highlight_all = 1
g.python_highlight_space_errors = 0

-- ruby
g.ruby_indent_block_style = "do"
g.ruby_indent_assignment_style = "variable"
g.ruby_heredoc_syntax_filetypes = {
  pgsql = { start = "SQL" },
  ruby = { start = "RUBY" },
  xml = { start = "XML" },
  yaml = { start = "YAML" },
}
