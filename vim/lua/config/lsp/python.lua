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
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
            config = function()
                local path = require("mason-registry").get_package("debugpy"):get_install_path()
                require("dap-python").setup(path .. "/venv/bin/python")
            end,
        },
    },
}

