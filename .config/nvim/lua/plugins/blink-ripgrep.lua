return {
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "mikavilpas/blink-ripgrep.nvim",
        version = "*",  -- use latest stable version
      },
    },
    opts = function(_, opts)
      -- Add ripgrep to default sources
      if not opts.sources then
        opts.sources = {}
      end
      if not opts.sources.default then
        opts.sources.default = {}
      end
      table.insert(opts.sources.default, "ripgrep")
      
      -- Configure the ripgrep provider
      if not opts.sources.providers then
        opts.sources.providers = {}
      end
      
      opts.sources.providers.ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        opts = {
          prefix_min_len = 3,
          max_filesize = "1M",
          project_root_marker = ".git",
          -- Add --hidden to include hidden files/directories
          backend = {
            use = "ripgrep",
            ripgrep = {
              additional_rg_options = {
                "--hidden",
                "--glob", "!.git",
                "--glob", "!.idea",           -- Exclude IntelliJ
                "--glob", "!.vscode",         -- Exclude VSCode
                "--glob", "!.venv",           -- Exclude Python virtual env
                -- "--glob", "!.env",            -- Exclude env files
                "--glob", "!*.pyc",           -- Exclude compiled Python
                "--glob", "!__pycache__",     -- Exclude Python cache
                "--glob", "!target",          -- Exclude Rust/Java build dir
                "--glob", "!dist",            -- Exclude build outputs
                "--glob", "!*.log",           -- Exclude logs
              },
            },
          },
        },
        transform_items = function(_, items)
          for _, item in ipairs(items) do
            item.labelDetails = {
              description = "(rg)",
            }
          end
          return items
        end,
      }
      return opts
    end,
  },
}
