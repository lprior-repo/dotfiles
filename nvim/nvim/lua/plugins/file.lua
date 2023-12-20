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
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "actionlint",
          "gh",
          "cbfmt",
          "css-lsp",
          "cuelsp",
          "ansible-language-server",
          "ansible-lint",
          "bash-language-server",
          "bash-debug-adapter",
          "golangci-lint",
          "html-lsp",
          "json-lsp",
          "jq",
          "jq-lsp",
          "nginx-language-server",
          "markuplint",
          "templ",
          "stylua",
          "shellcheck",
          "shfmt",
          "flake8",
          "terraform-ls",
          "tflint",
          "tfsec",
          "yaml-language-server",
          "yamllint",
          "yamlfmt",
          "yq",
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = true },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp, copilot = require("cmp"), require("copilot.suggestion")
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        return
      end
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      if not opts.mapping then
        opts.mapping = {}
      end
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<C-x>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.next()
        end
      end)

      opts.mapping["<C-z>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.prev()
        end
      end)

      opts.mapping["<C-right>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.accept_word()
        end
      end)

      opts.mapping["<C-l>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.accept_word()
        end
      end)

      opts.mapping["<C-down>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.accept_line()
        end
      end)

      opts.mapping["<C-j>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.accept_line()
        end
      end)

      opts.mapping["<C-c>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.dismiss()
        end
      end)
      return opts
    end,
  },
  -- Get thick virtual text lines
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
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
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
}
