require("livepreview.config").set()

vim.keymap.set("n", "<leader>ls", function()
    vim.cmd("LivePreview start")
end, {
    desc = "Live Preview",
})
