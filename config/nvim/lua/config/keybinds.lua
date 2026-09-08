-- KEYBINDS
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- N: enter netrw file manager: (<space> + cd)
-- vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)


-- V: move selected lines up and down: (J/K)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- N: remap joining lines: (J/L)
vim.keymap.set("n", "J", "mzJ` z")
vim.keymap.set("n", "L", "i<CR><Esc>mz_`z")


-- N: keep cursor in place while moving up/down page: (<ctrl> + d/u)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- N: center screen when looping search results "/text": (n/N)
vim.keymap.set("n", "n", "nzzzv")       
vim.keymap.set("n", "N", "Nzzzv")


-- clipboard settings
-- V: paste and don't replace clipboard over deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dp', opts)


-- NV: Delete and don't yank to register 
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


-- N: Prevents deleted characters from copying to clipboard
vim.keymap.set("n", "x", '"_x"', opts)


-- I: sometimes in insert mode, control-c doesn't exactly work like escape: (<ctrl> + c)
vim.keymap.set("i", "<C-c>", "<Esc>")


-- N: add binds for control J/K to scroll thru quickfix list: (<ctrl> + j/k)
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")


-- N: what the heck is Ex mode? prevents accidnetal ":Ex": (Q)
vim.keymap.set("n", "Q", "<nop>")


-- N: --- :(<space> + j/k)
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- N: lint / format php files for LC: (<space> + cc)
vim.keymap.set("n", "<leader>cc", "<cmd>!php-cs-fixer fix % --using-cache=no<cr>")


-- N: replace all instances of whatever is under cursor (on line): (<space> + s)
-- vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])


-- N: Replace the word cursor is on globally: (<space> + s)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })


-- N: make file executable: (<space> + x)
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- NV: yank into clipboard even if on ssh: (<space> + y)
vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator")
vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual")


-- N: reload without exiting vim: (<space> + rl)
vim.keymap.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")


-- N: --- : (<space> + u)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- N: quickfix list stuff: (<space> + cl / co / cn / cp / li)
vim.keymap.set("n", "<leader>cl", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", ":cprev<CR>zz")
vim.keymap.set("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP Info" })


-- N: clear search highlights: (<ctrl> + l)
vim.keymap.set("n", "<C-l>", ":noh<CR><C-l>", opts)
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- N: paste bellow: (<space> + p)
vim.keymap.set("n", "<leader>p", "o<esc>Pk<CR>", opts)


-- N: select all: (<ctrl> + a)
vim.keymap.set("n", "<C-a>", "ggVG", opts)


-- N: access terminal: (<space> + `)
vim.keymap.set("n", "<leader>`", ":<C-u>term<CR>i", opts)


-- V: copy to clipboard: (<space> + y)
vim.keymap.set("v", "<leader>y", '"+y', opts)


-- I: auto-closing brackets and quotes
-- vim.keymap.set("i", '"', '""<Left>')
-- vim.keymap.set("i", "'", "''<Left>")
-- vim.keymap.set("i", "`", "``<Left>")
-- vim.keymap.set("i", "(", "()<Left>")
-- vim.keymap.set("i", "[", "[]<Left>")
-- vim.keymap.set("i", "{", "{}<Left>")
-- vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<Esc>O", opts)


-- V: indent selected lines and keep selection: (<tab>)
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent visual selection" })
-- V: Outdent selected lines and keep selection: (<shift> + <tab>)
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent visual selection" })


-- V: indent selected lines and keep selection: (<)
vim.keymap.set("v", "<", "<gv", opts)
-- V: Outdent selected lines and keep selection: (>)
vim.keymap.set("v", ">", ">gv", opts)


-- V: visual (surround text in visual mode)
-- parentheses
vim.keymap.set("v", "(", "<esc>`>a)<esc>`<i(<esc>gv", { remap = false })
-- curly braces
vim.keymap.set("v", "{", "<esc>`>a}<esc>`<i{<esc>gv", { remap = false })
-- square brackets
vim.keymap.set("v", "[", "<esc>`>a]<esc>`<i[<esc>gv", { remap = false })
-- double quotes
vim.keymap.set("v", '"', '<esc>`>a"<esc>`<i"<esc>gv', { remap = false })
-- single quotes
vim.keymap.set("v", "'", "<esc>`>a'<esc>`<i'<esc>gv", { remap = false })


-- EXIT and SAVE (CAPS): (W, Q, Q!)
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })

vim.api.nvim_create_user_command("Q", function(opts)
    vim.cmd("q" .. (opts.bang and "!" or ""))
end, { bang = true })


-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


-- N: Copy filepath to the clipboard: (<space> + fp)
vim.keymap.set("n", "<leader>fp", function()
    local filePath = vim.fn.expand("%:~")
    vim.fn.setreg("+", filePath)
    print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })
