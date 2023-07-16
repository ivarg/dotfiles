return {
    "nvim-treesitter/nvim-treesitter",
    enabled = false,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "python", "rust", "toml" },
            sync_install = false,
            auto_install = true,
            build = ":TSUpdate",
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            }
        })
    end,
}
