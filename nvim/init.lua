-- 基础设置
vim.g.mapleader = " "             -- 设置 leader 键为空格
vim.opt.number = true             -- 显示行号
vim.opt.relativenumber = false    -- 显示相对行号
vim.opt.tabstop = 4               -- Tab 显示为 4 个空格
vim.opt.shiftwidth = 4            -- 自动缩进为 4 个空格
vim.opt.expandtab = true          -- 将 Tab 转为空格
vim.opt.smartindent = true        -- 智能缩进
vim.opt.wrap = false              -- 禁用换行
vim.opt.cursorline = true         -- 高亮当前行
vim.opt.clipboard = "unnamedplus" -- 系统剪贴板支持
vim.opt.termguicolors = true      -- 启用 24 位颜色支持
vim.opt.ignorecase = true         -- 搜索忽略大小写
vim.opt.smartcase = true          -- 智能大小写区分
vim.opt.incsearch = true          -- 增量搜索
-- vim.opt.hlsearch = true           -- 高亮搜索结果
vim.opt.updatetime = 300          -- 更快的触发时间
vim.opt.timeoutlen = 500          -- 键组合超时
vim.opt.encoding = "utf-8"        -- 设置文件编码
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false            -- 禁用备份
vim.opt.writebackup = false       -- 禁用写入备份
vim.opt.swapfile = false          -- 禁用交换文件
vim.opt.foldmethod = 'syntax'     -- 启用基于语法的折叠
vim.opt.foldenable = true
-- 主题颜色
-- vim.cmd 'colorscheme slate'
-- 添加 tokyodark 主题路径
vim.opt.runtimepath:prepend(vim.fn.expand('~/.config/nvim/site/pack/colors/start/tokyodark.nvim'))
-- 启用真彩色
vim.opt.termguicolors = true
-- 设置主题
require("tokyodark").setup()
vim.cmd('syntax enable')
vim.cmd('colorscheme tokyodark')
-- 自动补全code snippets 相对路径是~/.config/nvim/lua
require('plugins.md_snippets').setup()
-- 其他配置
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
-- vim.o.showmode = false
