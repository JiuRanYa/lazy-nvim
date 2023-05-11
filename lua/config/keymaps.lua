local keymap = vim.keymap.set

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- nvim-tree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", {}) -- open/close

-- buffer line 切换
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-l>", ":BufferLineCycleNext<CR>", opt)

map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>l", "<C-w>l", opt)

map('n', '<leader>`', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
