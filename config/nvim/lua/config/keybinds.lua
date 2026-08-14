-- KEYBINDS
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Alt Up/Down in vscode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")       -- Remap joining lines
vim.keymap.set("n", "L", "i<CR><Esc>mz_`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Keep cursor in place while moving up/down page
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")       -- center screen when looping search results
vim.keymap.set("n", "N", "Nzzzv")

-- paste and don't replace clipboard over deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- sometimes in insert mode, control-c doesn't exactly work like escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- add binds for Control J/K to scroll thru quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- What the heck is Ex mode? prevents accidnetal :Ex
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- lint / format php files for LC
vim.keymap.set("n", "<leader>cc", "<cmd>!php-cs-fixer fix % --using-cache=no<cr>")

-- Replace all instances of whatever is under cursor (on line)
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- make file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- yank into clipboard even if on ssh
vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator")
vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual")

-- reload without exiting vim
vim.keymap.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Quickfix list stuff
vim.keymap.set("n", "<leader>cl", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", ":cprev<CR>zz")
vim.keymap.set("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP Info" })

-- my stuff
-- clear search highlights
vim.keymap.set("n", "<C-l>", ":noh<CR><C-l>", { noremap = true, silent = true })
-- paste bellow
vim.keymap.set("n", "<leader>p", "o<esc>Pk<CR>", { noremap = true, silent = true })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Access terminal
vim.keymap.set("n", "<leader>`", ":<C-u>term<CR>i", { noremap = true, silent = true })

-- Copy to clipboard
-- vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- Auto-closing brackets and quotes
vim.keymap.set("i", '"', '""<Left>')
vim.keymap.set("i", "'", "''<Left>")
vim.keymap.set("i", "`", "``<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "{;<CR>", "{<CR>};<Esc>O", { noremap = true, silent = true })

-- Indent selected lines and keep selection
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent visual selection" })
-- Outdent selected lines and keep selection
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent visual selection" })

-- surround text in visual mode

-- Parentheses
vim.keymap.set("v", "(", "<esc>`>a)<esc>`<i(<esc>gv", { remap = false })
-- Curly braces
vim.keymap.set("v", "{", "<esc>`>a}<esc>`<i{<esc>gv", { remap = false })
-- Square brackets
vim.keymap.set("v", "[", "<esc>`>a]<esc>`<i[<esc>gv", { remap = false })
-- Double quotes
vim.keymap.set("v", '"', '<esc>`>a"<esc>`<i"<esc>gv', { remap = false })
-- Single quotes
vim.keymap.set("v", "'", "<esc>`>a'<esc>`<i'<esc>gv", { remap = false })

-- EXIT and SAVE
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })

vim.api.nvim_create_user_command("Q", function(opts)
    vim.cmd("q" .. (opts.bang and "!" or ""))
end, { bang = true })

-- source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
