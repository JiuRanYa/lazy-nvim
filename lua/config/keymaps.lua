local keymap = vim.keymap.set

local builtin = require('telescope.builtin')

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- 刷新lua配置
map('n', '<leader>rs', ':luafile ~/.config/nvim/init.lua<CR>', {noremap = true})

-- nvim-tree
map("n", "<C-b>", ":NvimTreeToggle<CR>", {}) -- open/close

-- buffer line 切换
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-l>", ":BufferLineCycleNext<CR>", opt)

-- 窗口切换
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>l", "<C-w>l", opt)

-- 保存文件
map("n", "<C-s>", ":w<CR>", {})

-- telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- lazy git
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


-- lspsaga
keymap("n", "[E", function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true })
keymap("n", "]E", function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true })
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- Rename
keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })

