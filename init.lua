--   =================================
--  == Sammi's (Neovim!) config :3 ==
-- =================================

-- NOTE: If you change something, hit ":w", followed a shoutout ":so"


-- config vanilla neovim settings
require("set_opts")


--   -------------------------------------------
--  -- Plugin Initializing and Bootstrapping --
-- -------------------------------------------

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


-- initialize plugins
-- NOTE: add any new plugins to lua/plugins.lua
require('plugins')


-- configure anything that could rely on plugins
require("theme")
require("keybindings")
require("lsp")
