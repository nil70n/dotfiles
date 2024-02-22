local opt = vim.opt
local g = vim.g
local o = vim.o

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
opt.scrolloff = 20     -- minimum number of lines above and below the cursor

-- Search
opt.ignorecase = true -- ignore case while searching
opt.smartcase = true  -- override ignore case if search pattern contains uppercase chars

-- Python3 support
g.python3_host_prog = '/usr/bin/python3'

-- Cursorline
opt.cursorline = true

require("nil70n.settings.filetype")
require("nil70n.settings.commands")
