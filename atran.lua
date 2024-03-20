local Util = require("lazyvim.util")

return {
  {
    "jmederosalvarado/roslyn.nvim",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      require("roslyn").setup({
        capabilities = capabilities,
        on_attach = function(client, buffer)
          require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
        end
      })
    end
  },

  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonfly",
    },
  },

  { "folke/which-key.nvim", enabled = false },
  { "echasnovski/mini.surround", enabled = false },

  {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", Util.telescope("find_files"), desc = "Find Files (root dir)" },
      -- find
      { "<leader>ff", Util.telescope("find_files"), desc = "Find Files (root dir)" },
      { "<leader>fF", Util.telescope("find_files", { cwd = false }), desc = "Find Files (cwd)" },
    },
  },
}
