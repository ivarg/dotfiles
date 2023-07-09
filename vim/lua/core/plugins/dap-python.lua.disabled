--
-- Created a dedicated venv with `pyenv virtualenv 3.10 debugpy`
--

return {
    "mfussenegger/nvim-dap-python",
    dependencies = { "theHamsta/nvim-dap-virtual-text", "rcarriga/nvim-dap-ui" },
    config = function()
        require("dap-python").setup("$PYENV_ROOT/versions/debugpy/bin/python")
    end,
}
