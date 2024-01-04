local opt = vim.opt
local g = vim.g

-- Leader key
g.mapleader = " "

-- General
opt.swapfile = false -- don't create swapfile
opt.undofile = false -- disable persistent undo

-- Clipboard
opt.clipboard:append { 'unnamedplus' }

-- Relative Numbers
opt.number = true
opt.relativenumber = true

-- Interface
opt.signcolumn = 'yes' -- always show the sign column
opt.scrolloff = 20 -- minimum number of lines above and below the cursor

-- Search
opt.ignorecase = true -- ignore case while searching
opt.smartcase = true -- override ignore case if search pattern contains uppercase chars

require("nil70n.settings.filetype")
require("nil70n.settings.commands")
