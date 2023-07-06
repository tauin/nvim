vim.loader.enable()
local opt = vim.opt

local g = vim.g

local indentWidth = 4

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.cursorline = true
if not vim.fn.has("wsl") then
  opt.clipboard = "unnamedplus" -- VERY slow using WSL
end
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.numberwidth = 4
opt.showmode = false
opt.mouse = ""

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
opt.undodir = vim.fn.stdpath("data") .. "/undo"

--test
-- NetRW Tree
g.mundo_right = 1
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_winsize = 20
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hidden = true
if not vim.g.vscode then
  g.mapleader = " "
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)
  require("tau.plugins")
  require("tau.term-conf")
  require("tau.keymap")
else
  g.mapleader = ","
end
