local keymap = vim.keymap.set

local builtin = require('telescope.builtin')
local hop = require('hop')
local directions = require('hop.hint').HintDirection

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function NvimTreeOSOpen()
    local lib = require "nvim-tree.lib"
    local node = lib.get_node_at_cursor()
    if node then
      vim.fn.jobstart("open '" .. node.absolute_path .. "' &", {detach = true})
    end
end

keymap("n", "<leader>of", function () NvimTreeOSOpen() end)

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
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "fd", "<cmd>Lspsaga find_definition<CR>", { silent = true })
keymap("n", "gf", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>p", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "<leader>n", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Comment
keymap("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end)

-- format
map("n", "<C-s>", ":Neoformat<CR>", opt)

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
