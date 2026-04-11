return {
  "jay-babu/mason-null-ls.nvim",
  opts = {
    handlers = {
      yamllint = function()
        local nls = require("null-ls")
        local wrapper = vim.fn.stdpath("config") .. "/bin/yamllint-wrapper"

        nls.register(
          nls.builtins.diagnostics.yamllint.with({
            command = wrapper,
            -- We pass everything. The wrapper is now smart enough to sort it out.
            args = { "--format", "parsable", "--file-name", "$FILENAME", "-" },
          })
        )
      end,
    },
  },
}
