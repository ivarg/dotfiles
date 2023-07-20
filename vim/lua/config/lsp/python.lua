local root_files = {
    "pyproject.toml",
    "setup.py",
    ".git",
}

return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            pyright = {
                ivar = "hej",
                root_dir = function(filename)
                    local root = vim.fs.find(root_files, {
                        path = vim.fs.dirname(filename),
                        upward = true
                    })[1]
                    return vim.fs.dirname(root)
                end,
                on_new_config = function(_, root)
                    print(string.format("python root: %s", root))
                end
            },
        },
    },
}

