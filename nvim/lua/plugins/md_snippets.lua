local M = {}
M.setup = function()
-- 添加 LuaSnip nvim-cmp 路径
vim.opt.runtimepath:prepend(vim.fn.expand('~/.config/nvim/site/pack/packer/start/nvim-cmp'))
vim.opt.runtimepath:prepend(vim.fn.expand('~/.config/nvim/site/pack/packer/start/LuaSnip'))
local cmp = require('cmp')
local luasnip = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node
-- 在 LuaSnip 配置中启用目标语言
--luasnip.filetype_extend("markdown", { "markdown" })
-- 加载必要补全源,snipptes文件必须是json
--require('luasnip.loaders.from_vscode').lazy_load({ paths = "~/.config/nvim/snippets" })
-- 添加自定义的snippets
luasnip.add_snippets('markdown',{
s('math',fmt([[
$$
{}
$$
]],{i(1)})),
s('br',{
t("<br>")
}),
s('text',fmt([[
\text{{{}}}
]],{i(1,'d')})),
s('disp',fmt([[
\displaystyle{}
]],{i(1)})),
s('dlim',fmt([[
\displaystyle\lim_{{{}\to\infty}}
]],{i(1,'x')})),
s('left',fmt([[
\left({}\right)
]],{i(1)})),
s('frac',fmt([[
\frac{{{}}}{{{}}}
]],{i(1,'\\pi'),i(2,'2')})),
s('sqrt',fmt([[
\sqrt[{}]{{{}}}
]],{i(1,'n'),i(2,'2')})),
s('dfrac',fmt([[
\displaystyle\frac{{{}}}{{{}}}
]],{i(1,'\\pi'),i(2,'2')})),
s('dsum',fmt([[
\displaystyle\sum_{{{}=0}}^{{{}}}
]],{i(1,'k'),i(2,'\\infty')})),
s('dint',fmt([[
\displaystyle\int_{{{}}}^{{{}}}
]],{i(1,'0'),i(2,'\\infty')})),
s('seq',fmt([[
{}_1,{}_2,\cdots,{}_n
]],{i(1,'x'),i(2,'x'),i(3,'x')})),
s('case',fmt([[
\begin{{cases}}
{}, &\text{{{}>0}}\\
{}, &\text{{others}}
\end{{cases}}
]],{i(1,'a'),i(2,'a'),i(3,'0')})),
s('align',fmt([[
\begin{{align}}
{}&=\\
&{}
\end{{align}}
]],{i(1,'f(x)'),i(2,'g(x)')})),
s('aligned',fmt([[
\begin{{aligned}}
{}&=\\
&{}
\end{{aligned}}
]],{i(1,'f(x)'),i(2,'a')})),
s('vmatrix',fmt([[
\begin{{vmatrix}}
{} & \cdots & {} \\
\vdots & \ddots & \vdots \\
{} & \cdots & {}
\end{{vmatrix}}
]],{i(1,'a_{11}'),i(2,'a_{1n}'),i(3,'a_{n1}'),i(4,'a_{nn}')})),
s('bmatrix',fmt([[
\begin{{bmatrix}}
{} & \cdots & {} \\
\vdots & \ddots & \vdots \\
{} & \cdots & {}
\end{{bmatrix}}
]],{i(1,'a_{11}'),i(2,'a_{1n}'),i(3,'a_{n1}'),i(4,'a_{nn}')})),
s('pmatrix',fmt([[
\begin{{pmatrix}}
{} & \cdots & {} \\
\vdots & \ddots & \vdots \\
{} & \cdots & {}
\end{{pmatrix}}
]],{i(1,'a_{11}'),i(2,'a_{1n}'),i(3,'a_{n1}'),i(4,'a_{nn}')}))
})
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,{'i','s'}),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,{'i','s'}),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    -- { name = 'spell' },
    -- { name = 'treesitter' },
  }),
})
end

return M
