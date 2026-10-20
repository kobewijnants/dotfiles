return {
  {
    "saghen/blink.cmp",
    optional = true, -- Or adjust as needed for your setup
    opts = {
      completion = {
        list = {
          selection = {
            preselect = false, -- Disable preselection
            auto_insert = false, -- Also prevent auto-inserting
          },
        },
      },
    },
  },
}
