--   ------------------
--  -- Packer Stuff --
-- ------------------

-- Packer startup and plugin configs
return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- theme
  use { "ellisonleao/gruvbox.nvim" }

  -- modeline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
  }

  use { 'j-hui/fidget.nvim', tag = 'legacy' }
  if packer_bootstrap then
    require('packer').sync()
  end
end
)
