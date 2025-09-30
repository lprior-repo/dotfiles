return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  opts = {
    servers = {
      -- Configure Copilot LSP for sidekick.nvim
      copilot = {
        settings = {
          copilot = {
            enable = true,
            -- Enable inline completions
            inlineCompletions = {
              enable = true,
            },
            -- Enable panel completions
            panelCompletions = {
              enable = true,
            },
          },
        },
      },
    },
    setup = {
      copilot = function(_, opts)
        require("lspconfig").copilot.setup(opts)
        return true
      end,
    },
  },
}
