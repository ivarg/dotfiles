local M = {}

function M.setup(_, opts)
    for server, server_opts in pairs(opts.servers) do
        require("lspconfig")[server].setup(server_opts)
    end
end

return M
