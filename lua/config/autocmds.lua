-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    -- Organize imports
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end

    -- Formatting (updated for Neovim 0.6 and above)
    vim.lsp.buf.format({ async = false })
  end,
})

local api = vim.api
--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})

-- detect terraform
-- https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md
-- expects a terraform filetype and not a tf filetype
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tf" },
  callback = function()
    vim.api.nvim_command("set filetype=terraform")
  end,
})

-- detect terraform vars
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "terraform-vars",
  callback = function()
    vim.api.nvim_command("set filetype=hcl")
  end,
})

-- fix terraform and hcl comment string
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
  pattern = { "*tf" },
})

-- Define the group for Ansible-related autocmds
local ansible_group = vim.api.nvim_create_augroup("Ansible", { clear = true })

-- Autocommand to set filetype for Ansible YAML files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- Pattern to match Ansible-related YAML files in tasks, roles, handlers, and molecule directories
  pattern = "*/(tasks|roles|handlers|molecule)/*.y?ml",

  -- Callback to set the filetype
  callback = function()
    vim.opt.filetype = "yaml.ansible"
  end,
  -- Assign to the Ansible group
  group = ansible_group,
})
