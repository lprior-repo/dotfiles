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
  {
    "mfussenegger/nvim-ansible",
  },
  {
    {
      "theprimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("harpoon"):setup()
      end,
      keys = {
        {
          "<leader>hh",
          function()
            require("harpoon"):list():append()
          end,
          desc = "harpoon pick file",
        },
        {
          "<leader>hm",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "harpoon menu show",
        },
        {
          "<leader>h1",
          function()
            require("harpoon"):list():select(1)
          end,
          desc = "harpoon to file 1",
        },
        {
          "<leader>h2",
          function()
            require("harpoon"):list():select(2)
          end,
          desc = "harpoon to file 2",
        },
        {
          "<leader>h3",
          function()
            require("harpoon"):list():select(3)
          end,
          desc = "harpoon to file 3",
        },
        {
          "<leader>h4",
          function()
            require("harpoon"):list():select(4)
          end,
          desc = "harpoon to file 4",
        },
        {
          "<leader>h5",
          function()
            require("harpoon"):list():select(5)
          end,
          desc = "harpoon to file 5",
        },
      },
    },
  },
  {
    "https://git.sr.ht/~swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<leader>zh", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left" } },
      { "<leader>zj", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
      { "<leader>zk", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
      { "<leader>zl", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
    },
    opts = {},
  },
  {
    -- Set up keybindings group names. Harpoon to file for example
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>z"] = { name = "+zellij" },
        ["<leader>cg"] = { name = "+go" },
        ["<leader>ct"] = { name = "+terraform" },
        ["<leader>ca"] = { name = "+ansible" },
        ["<leader>cam"] = { name = "+ansible molecule" },
        ["<leader>caml"] = { name = "+ansible local" },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
}
