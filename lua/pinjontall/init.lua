require('pinjontall.packer')
require('pinjontall.keymaps')
require('pinjontall.set')
-- These are all my config options and sets that don't otherwise belong to any
-- existing plugin

local augroup = vim.api.nvim_create_augroup
local PinjontallGroup = augroup('Pinjontall', {})

local autocmd = vim.api.nvim_create_autocmd

-- Delete trailing whitespace 
--
-- Use an autocmd (in this case, for a group PinjontallGroup) that calls 
-- ":%s/\s+$//e" implicitly before any buffer is saved 
autocmd({"BufWritePre"}, {
	group = PinjontallGroup,
	pattern = "*",
	command = [[%s/\s+$//e]],
})
