return {
    -- Mini Nvim
    {"echasnovski/mini.nvim", version = false },
    -- File explorer (this works properly with oil unlike nvim-tree)
    {
        'echasnovski/mini.files',
        config = function()
            local MiniFiles = require("mini.files")
            MiniFiles.setup({
                mappings = {
                    go_in = "<CR>", -- Map both Enter and L to enter directories or open files
                    go_in_plus = "L",
                    go_out = "_",
                    go_out_plus = "H",
                },
            })
            vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" }) -- toggle file explorer
            vim.keymap.set("n", "<leader>ef", function()
                MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
                MiniFiles.reveal_cwd()
            end, { desc = "Toggle into currently opened file" })
        end,
    },
    -- Mini Notify
    {
        "echasnovski/mini.notify",
        config = function()
            require("mini.notify").setup({
                content = {
                    format = function(notif)
                        return notif.msg
                    end,
                },
                window = {
                    config = function()
                        return {
                            title = "",
                            anchor = "SE",
                            row = vim.o.lines - 2,
                            col = vim.o.columns,
                            border = "none",
                        }
                    end,
                },
            })
        end
    },
}
