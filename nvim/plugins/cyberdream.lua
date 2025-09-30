return {
  "scottmckendry/cyberdream.nvim",
  name = "cyberdream",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      -- Enable transparent background
      transparent = false,

      -- Enable italics comments
      italic_comments = true,

      -- Replace all fillchars with ' ' for the ultimate clean look
      hide_fillchars = false,

      -- Modern borderless telescope theme - also applies to fzf-lua
      borderless_telescope = true,

      -- Set terminal colors used in `:terminal`
      terminal_colors = true,

      -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache
      -- and clear with :CyberdreamClearCache
      cache = false,

      theme = {
        variant = "default", -- use "light" for the light variant. Also accepts "auto" to set it based on vim.o.background
        highlights = {
          -- Enhanced visibility for various UI components
          Comment = { fg = "#6272a4", italic = true },

          -- Better contrast for search results
          Search = { bg = "#bd93f9", fg = "#282a36", bold = true },
          IncSearch = { bg = "#f1fa8c", fg = "#282a36", bold = true },

          -- Improved diff colors
          DiffAdd = { bg = "#50fa7b", fg = "#282a36", bold = true },
          DiffDelete = { bg = "#ff5555", fg = "#282a36", bold = true },
          DiffChange = { bg = "#ffb86c", fg = "#282a36", bold = true },
          DiffText = { bg = "#bd93f9", fg = "#282a36", bold = true },

          -- Enhanced error and warning visibility
          DiagnosticError = { fg = "#ff5555", bold = true },
          DiagnosticWarn = { fg = "#ffb86c", bold = true },
          DiagnosticInfo = { fg = "#8be9fd", bold = true },
          DiagnosticHint = { fg = "#6272a4", bold = true },
        },

        -- Override a highlight group entirely using the color palette
        overrides = function(colors)
          return {
            -- Enhanced telescope integration
            TelescopeNormal = { bg = colors.bg, fg = colors.fg },
            TelescopeBorder = { bg = colors.bg, fg = colors.blue },
            TelescopePromptNormal = { bg = colors.bg_dark },
            TelescopePromptBorder = { bg = colors.bg_dark, fg = colors.blue },
            TelescopePromptTitle = { bg = colors.blue, fg = colors.bg },
            TelescopePreviewTitle = { bg = colors.green, fg = colors.bg },
            TelescopeResultsTitle = { bg = colors.bg, fg = colors.bg },

            -- Enhanced which-key integration
            WhichKey = { fg = colors.cyan, bold = true },
            WhichKeyGroup = { fg = colors.blue },
            WhichKeyDesc = { fg = colors.fg },
            WhichKeySeperator = { fg = colors.grey },
            WhichKeyFloat = { bg = colors.bg_dark },
            WhichKeyBorder = { bg = colors.bg_dark, fg = colors.blue },

            -- Enhanced trouble.nvim integration
            TroubleText = { fg = colors.fg },
            TroubleCount = { fg = colors.magenta, bg = colors.bg_dark },
            TroubleNormal = { fg = colors.fg, bg = colors.bg },

            -- Enhanced gitsigns integration
            GitSignsAdd = { fg = colors.green },
            GitSignsChange = { fg = colors.orange },
            GitSignsDelete = { fg = colors.red },

            -- nvim-tree extension not available in cyberdream

            -- Enhanced flash.nvim integration
            FlashBackdrop = { fg = colors.grey },
            FlashMatch = { bg = colors.cyan, fg = colors.bg, bold = true },
            FlashCurrent = { bg = colors.orange, fg = colors.bg, bold = true },
            FlashLabel = { bg = colors.red, fg = colors.bg, bold = true },

            -- BufferLine not supported in cyberdream extensions
            -- Remove these highlights since bufferline extension doesn't exist

            -- Enhanced todo-comments integration
            TodoBgFIX = { fg = colors.bg, bg = colors.red, bold = true },
            TodoBgHACK = { fg = colors.bg, bg = colors.orange, bold = true },
            TodoBgNOTE = { fg = colors.bg, bg = colors.blue, bold = true },
            TodoBgPERF = { fg = colors.bg, bg = colors.magenta, bold = true },
            TodoBgTODO = { fg = colors.bg, bg = colors.cyan, bold = true },
            TodoBgWARN = { fg = colors.bg, bg = colors.yellow, bold = true },

            -- Enhanced yanky integration
            YankyPut = { bg = colors.cyan, fg = colors.bg },
            YankyYanked = { bg = colors.orange, fg = colors.bg },

            -- Enhanced vim-illuminate integration
            IlluminatedWordText = { bg = colors.bg_highlight },
            IlluminatedWordRead = { bg = colors.bg_highlight },
            IlluminatedWordWrite = { bg = colors.bg_highlight },

            -- Enhanced render-markdown integration
            RenderMarkdownH1Bg = { bg = colors.red },
            RenderMarkdownH2Bg = { bg = colors.orange },
            RenderMarkdownH3Bg = { bg = colors.yellow },
            RenderMarkdownH4Bg = { bg = colors.green },
            RenderMarkdownH5Bg = { bg = colors.blue },
            RenderMarkdownH6Bg = { bg = colors.magenta },

            -- Enhanced avante integration
            AvanteTitle = { fg = colors.blue, bold = true },
            AvanteReversedTitle = { fg = colors.bg, bg = colors.blue },
            AvanteSubtitle = { fg = colors.orange },
            AvanteReversedSubtitle = { fg = colors.bg, bg = colors.orange },
            AvanteThirdTitle = { fg = colors.green },
            AvanteReversedThirdTitle = { fg = colors.bg, bg = colors.green },
          }
        end,

        -- Override a color entirely
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`
          -- Enhance some core colors for better contrast
          bg_highlight = "#373844",
          bg_dark = "#1e1e2e",
        },
      },
    })

    -- Set cyberdream as the colorscheme
    vim.cmd("colorscheme cyberdream")
  end,
}

:wq
