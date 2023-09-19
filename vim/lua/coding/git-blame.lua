-- vim.keymap.set("n", "<leader>bb", "<cmd>GitBlameToggle<cr>", {})

return {
    enabled = false,
    "f-person/git-blame.nvim",
    cmd = { "GitBlameToggle" },
    opts = {
        enabled = false,
    },
    config = function(plugin, opts)
        require("gitblame").setup(opts)
    end,
}
