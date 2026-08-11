return {
    -- Mason package manager
    {
        "williamboman/mason.nvim",
        config = true, -- automatically runs setup()
    },

    -- Optional: bridge Mason with LSPConfig
    {
        "williamboman/mason-lspconfig.nvim",
        config = true,
    },
}
