if vim.g.neovide then
	local alpha = function()
		return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.90
	vim.g.neovide_background_color = "#0f1117" .. alpha()
	-- Put anything you want to happen only in Neovide here
end

-- 字体
vim.o.guifont = "JetBrains Mono:h15"

vim.cmd([[ highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set guicursor+=i:ver1
set guicursor+=a:blinkon1
]])

local set = vim.o
vim.opt.swapfile = false
set.number = true
set.relativenumber = true
set.autoread = true
-- set.guicursor = "a:blinkon1,i:ver25"
set.encoding = "utf8"
set.termguicolors = true
set.ts = 2
set.sts = 2
set.sw = 2
set.hlsearch = true
set.autoindent = true
set.smartindent = true
-- https://www.youtube.com/watch?v=yMs97o_TdBU&t=344s&ab_channel=BenFrain
-- make window width same when close a window
set.sessionoptions = "blank"

-- 搜索时忽略大小写
set.ignorecase = true

set.modifiable = true
set.hidden = true
set.autoindent = true
set.mouse = "a"

set.clipboard = "unnamed"

-- 主题
vim.cmd.colorscheme("base16-tender")

if vim.fn.has('nvim-0.8') == 0 then
  error('Need Neovim 0.8+ in order to use this config')
end

-- Load main config
require("config")
