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

  { "rose-pine/neovim", name = "rose-pine" },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonfly",
    },
  },

  { "folke/which-key.nvim", enabled = false },
}
