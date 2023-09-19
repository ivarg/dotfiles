local root_files = {
    ".luarc.json",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    ".git",
}

return {
    -- enabled = false,
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            lua_ls = {
                root_dir = function(filename)
                    local root = vim.fs.find(root_files, {
                        path = vim.fs.dirname(filename),
                        upward = true,
                    })[1]
                    return vim.fs.dirname(root)
                end,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            },
        },
    },
}
