-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",

	-- own plugins
        "basedpyright",
        "gopls",
        "terraform-ls",
        "yaml-language-server",

        -- Formatters / Linters
        "black",
        "goimports",
        "golangci-lint",
        "isort",
        "pylint",
        "ruff",
        "terraform",
        "tflint",
        "tfsec",
        "yamlfmt",
        "yamllint",

        -- Debuggers & Tools
        "debugpy",
        "stylua",
        "tree-sitter-cli",
      },
      -- auto_install = true, -- Force install on startup
    },
  },
}
