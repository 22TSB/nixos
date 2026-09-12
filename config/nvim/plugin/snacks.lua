require("snacks").setup({
    picker = {
        enabled = true,
    },
})

vim.keymap.set("n", "<leader>pk", function()
    Snacks.picker.keymaps()
end, {
    desc = "Keymaps",
})
