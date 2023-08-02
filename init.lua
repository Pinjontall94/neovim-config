--   =================================
--  == Sammi's (Neovim!) config :3 ==
-- =================================

-- NOTE: If you change something, hit ":w", followed a shoutout ":so"

--   ----------------------------------
--  -- Quality of Life Improvements --
-- ----------------------------------

-- line numbers
vim.opt.nu = true

-- tabs -> spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- better indentation
vim.opt.smartindent = true

-- colors and fill column (if you want one)
vim.opt.termguicolors = true
-- vim.opt.colorcolumn = "100"


-- pretty colors!
require("gruvbox").setup()
vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')


-- modeline
require('lualine').setup({
  options = {theme = 'gruvbox'}
})


--   --------------
--  -- Keymaps --
-- -------------

-- Set space bar as leader key
vim.g.mapleader = " "

-- Map :Ex to <SPC>pv (i.e. "project view")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


--   ---------
--  -- LSP --
-- ---------

local lsp = require('lsp-zero').preset({})

-- Fix undefined global 'vim'
lsp.nvim_workspace()

-- Autocompletion bindings
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>clws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>cla", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>clrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>clrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
require('fidget').setup()

--   ------------------
--  -- Packer Stuff --
-- ------------------

-- Packer bootstrap
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.cmd('packadd packer.nvim')
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


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
