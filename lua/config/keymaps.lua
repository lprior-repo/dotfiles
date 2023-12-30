-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.luavim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")

-- remap move comments to <C-j> and <C-k>
vim.keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- vim.keymap.Other helpful Go keybinds
vim.keymap.set("n", "<leader>cgm", "<cmd>!go mod tidy <CR>", { desc = "go mod tidy" })
vim.keymap.set("n", "<leader>cgf", "<cmd>!go fmt .<CR>", { desc = "go fmt" })
vim.keymap.set("n", "<leader>cgg", "<cmd>!go get .<CR>", { desc = "go get" })
vim.keymap.set("n", "<leader>cgr", "<cmd>!go run .<R>", { desc = "go run" })
vim.keymap.set("n", "<leader>cgb", "<cmd>!go build .<CR>", { desc = "go build" })
vim.keymap.set("n", "<leader>cgt", "<cmd>!go test .<CR>", { desc = "go test" })

-- Terraform Keymaps
vim.keymap.set("n", "<leader>ctf", "<cmd>!terraform fmt<CR>", { desc = "terraform fmt" })
vim.keymap.set("n", "<leader>cti", "<cmd>!terraform init<CR>", { desc = "terraform init" })
vim.keymap.set("n", "<leader>ctp", "<cmd>!terraform plan<CR>", { desc = "terraform plan" })

-- Ansible Keymaps
vim.keymap.set("n", "<leader>camlc", "<cmd>!molecule converge -s local<CR>", { desc = "molecule test local" })
vim.keymap.set("n", "<leader>camlv", "<cmd>!molecule verify -s local<CR>", { desc = "molecule verify local" })
vim.keymap.set("n", "<leader>camlp", "<cmd>!molecule test -s local<CR>", { desc = "molecule test local" })
