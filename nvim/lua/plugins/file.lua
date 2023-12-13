return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "gmake",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
