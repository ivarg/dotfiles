return {
    "tpope/vim-commentary",
    config = function()
        vim.keymap.set("", "<leader>c<space>", ":Commentary<cr>")
    end,
}
