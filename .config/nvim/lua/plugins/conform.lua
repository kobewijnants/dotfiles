return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false,
      quiet = false,
    },
    formatters_by_ft = {
      ["tex"] = {
        "latexindent",
        opts = { args = { "-l=" } }, -- prevents `indent.log` file creation
      },
      -- other formatters
    },
  },
}
