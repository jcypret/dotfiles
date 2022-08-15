return {
  lintSource = "flake8",
  lintCommand = "flake8 --stdin-display-name ${INPUT} -",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
}
