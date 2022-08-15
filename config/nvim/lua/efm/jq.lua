return {
  lintCommand = "jq .",
  lintStdin = true,
  lintFormats = { "%m at line %l, column %c" },
}
