-- Set PATH to include cargo bin for tree-sitter CLI
vim.env.PATH = vim.env.HOME .. "/.cargo/bin:" .. vim.env.PATH

-- Ensure tree-sitter CLI is available
local function check_treesitter_cli()
  local handle = io.popen("tree-sitter --version 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result:match("tree%-sitter") then
      return true
    end
  end
  return false
end

if not check_treesitter_cli() then
  vim.notify("tree-sitter CLI not found. Install with: cargo install tree-sitter-cli", vim.log.levels.WARN)
end
