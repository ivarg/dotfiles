
local M = {
    "EdenEast/nightfox.nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme carbonfox]])
    end,
}

return M
