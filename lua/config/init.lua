vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
  spec = {{{
    import = "plugins"
  }}},
})

local modules = {"config.vimc", "config.keymaps"}

for _, mod in ipairs(modules) do
    local ok, err = pcall(require, mod)
    if not ok then
        error(("Error loading %s...\n\n%s"):format(mod, err))
    end
end
