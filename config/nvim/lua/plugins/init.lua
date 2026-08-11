return {
    {
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        opts = {
            pre_hook = function(...)
                return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(...)
            end,
        },
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    }, -- {
    --     "nvim-lua/plenary.nvim",
    --     name = "plenary"
    -- },
}
