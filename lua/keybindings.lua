--   --------------
--  -- Keymaps --
-- -------------

-- Set space bar as leader key
vim.g.mapleader = " "

-- Map :Ex to <SPC>pv (i.e. "project view")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
