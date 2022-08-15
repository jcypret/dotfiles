return {
  rootMarkers = {
    ".pylintrc",
    "pylintrc",
  },
  lintSource = "pylint",
  lintCommand = [[
    pylint
    --output-format=text
    --reports=no
    --score=no
    --from-stdin "${INPUT}"
  ]],
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %t%n: %m" },
}
