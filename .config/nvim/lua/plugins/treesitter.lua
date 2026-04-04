-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
      "bash",
      "c",
      "dockerfile",
      "gitignore",
      "go",
      "ini",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "properties",
      "python",
      "query",
      "regex",
      "terraform",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
}
