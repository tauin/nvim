local opt = vim.opt

local g = vim.g
local cmd = vim.cmd
local o = vim.o

local indentWidth = 4

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.cursorline = true
opt.clipboard:append("unnamedplus")
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.numberwidth = 4
opt.showmode = false

opt.cmdheight = 1
--Tab configuration
opt.autoindent = true
opt.smartindent = true
opt.preserveindent = true
opt.shiftwidth = indentWidth
opt.softtabstop = indentWidth
opt.tabstop = indentWidth

-- How to read/write to the file
opt.backup = false
opt.autowrite = true
opt.autoread = true
opt.hlsearch = true
opt.ignorecase = true

-- Vim Undofile, rather than swap files (Combine with Vim-Mundo!)
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("config") .. "/undo"

--test
-- NetRW Tree
g.mundo_right = 1
g.netrw_banner = 0
g.netrw_liststyle = 3
vim.g.netrw_winsize = 20
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hidden = true
if not vim.g.vscode then
  g.mapleader = " "
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  require("tau.plugins")
  require("tau.term-conf")
end
