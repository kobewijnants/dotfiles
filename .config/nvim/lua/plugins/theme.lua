return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- add vague
  { "vague2k/vague.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
