return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["*"] = { "trim_whitespace" },
    },
    format_on_save = {
      lsp_fallback = true,
    },
    formatters = {
      trim_whitespace = {
        -- DO NOT remove final newline
        args = { "--keep-newline" },
      },
    },
  },
}
