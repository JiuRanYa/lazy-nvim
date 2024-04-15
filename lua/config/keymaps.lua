local keymap = vim.keymap.set

local hop = require('hop')
local directions = require('hop.hint').HintDirection

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- 设置jj退出insert
map('i', 'jj', '<Esc>', {noremap = true})

-- 刷新lua配置
map('n', '<leader>rs', ':luafile ~/.config/nvim/init.lua<CR>', {noremap = true})

map('n', ';', ':noh<CR>')
-- nvim-tree
map("n", "<C-b>", ":NvimTreeToggle<CR>", {}) -- open/close
map("n", "<C-f>", ":NvimTreeFindFile<CR>", {}) -- open/close

-- buffer line 切换
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-l>", ":BufferLineCycleNext<CR>", opt)

-- 关闭当前缓冲区
map('n', '<leader>bd', ':BufferLineClose<CR>', opts)

-- 关闭除当前缓冲区外的所有缓冲区
map('n', '<leader>bD', ':BufferLineCloseAllButCurrent<CR>', opts)

-- 窗口切换
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>l", "<C-w>l", opt)

-- 窗口分屏
map('n', '<leader>s', ':vsplit<CR>', opt)
map('n', '<leader>v', ':split<CR>', opt)
vim.keymap.set("n", "<S-Right>", ":vertical resize +5<CR>", opt)
vim.keymap.set("n", "<S-Left>", ":vertical resize -5<CR>", opt)
vim.keymap.set("n", "<S-Up>", ":resize +5<CR>", opt)

-- 保存文件
map("n", "<C-s>", ":w<CR>", opt)

-- lazy git
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- lspsaga
-- keymap("n", "[E", function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true })
-- keymap("n", "]E", function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true })
keymap("n","<leader>O", ":Lspsaga outline<CR>")
keymap("n", "K", ":Lspsaga hover_doc<CR>", { silent = true })
keymap({"n","v"}, "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
keymap("n", "rn", ":Lspsaga rename<CR>", { silent = true })
keymap("n", "gd", ":Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "fd", ":Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "gf", ":Lspsaga goto_definition<CR>", { silent = true })
keymap("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>,", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "<leader>.", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Comment
keymap("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end)

-- format
-- keymap("n", "<C-s>", function() require("conform").format({ bufnr = args.buf }) end, opt)

-- insert mode move cursor
map("i", "<C-l>", "<RIGHT>")
map("i", "<C-h>", "<LEFT>")

-- close tab for buffer line
keymap({"n","v"}, "<leader>cb", ":bdelet<CR>")

-- motion with hop
keymap("n", "<leader>w", ":HopWordMW<CR>", opt)
keymap('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
keymap('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
keymap('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
keymap('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

keymap("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })
