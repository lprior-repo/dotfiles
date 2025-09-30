return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Enable explorer module
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    -- Enable picker module  
    picker = {
      enabled = true,
      hidden = true, -- Show hidden files in search
      sources = {
        explorer = {
          hidden = true, -- Show all hidden files (dotfiles)
          ignored = false, -- Show gitignored files in explorer
          filter = function(entry)
            -- Always show .env files even if gitignored
            if entry.name:match("^%.env") then
              return true
            end
            -- Show all other files normally
            return true
          end,
          win = {
            list = {
              keys = {
                ["d"] = "explorer_del", -- Delete files/directories
                ["a"] = "explorer_add", -- Add new files/directories
                ["r"] = "explorer_rename", -- Rename files/directories
                ["c"] = "explorer_copy", -- Copy files/directories
              },
            },
          },
        },
        files = {
          hidden = true, -- Show hidden files in file picker
          filter = function(entry)
            -- Exception: always include .env files in search even if gitignored
            if entry.name:match("^%.env") then
              return true
            end
            -- For gitignored files that aren't .env, exclude from search
            if entry.gitignored and not entry.name:match("^%.env") then
              return false
            end
            return true
          end,
        },
      },
    },
  },
}
