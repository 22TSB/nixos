require("mini.files").setup()

vim.keymap.set("n", "<leader>ee", function()
    MiniFiles.open()
end, {
    desc = "File explorer",
})
