return {
  {
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
        ["tf"] = {
          "tfmt",
        },
        ["terraform"] = {
          "tfmt",
        },
        ["hcl"] = {
          "tfmt",
        },
      },
      formatters = {
        tfmt = {
          -- Specify the command and its arguments for formatting
          command = "tofu",
          args = { "fmt", "-" },
          stdin = true,
        },
      },
    },
  },
  {
    "nathom/filetype.nvim",
    config = function()
      -- Setup overrides for file extensions
      require("filetype").setup({
        overrides = {
          extensions = {
            tf = "terraform",
            tfvars = "terraform",
            tfstate = "json",
            tex = "tex",
          },
        },
      })
    end,
  },
}
