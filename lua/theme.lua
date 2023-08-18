--   ------------------------
--  -- Theme and Modeline --
-- ------------------------

-- pretty colors!
require("gruvbox").setup()
vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')


-- modeline
require('lualine').setup({
  options = {theme = 'gruvbox'}
})
