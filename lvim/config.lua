-- require "lean"


lvim.use_icons = false 
lvim.colorscheme = "gruvbox-material"
lvim.plugins= {
	{"sainnhe/gruvbox-material"},
	{"nvim-neorg/neorg"},
 	{'Julian/lean.nvim'},
  {'neovim/nvim-lspconfig'},
  {'nvim-lua/plenary.nvim'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'nvim-tree/nvim-web-devicons'},
  {'hrsh7th/vim-vsnip'},
  {'andrewradev/switch.vim'},
  {'tomtom/tcomment_vim'},
	{'pocco81/auto-save.nvim'},
  {'ThePrimeagen/vim-be-good'}
}


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.cpp" , "*.py" },
  command = "setlocal tabstop=4 shiftwidth=4"
})

lvim.builtin.which_key.setup.plugins.presets.z = true

-- disable lsp warning 
vim.diagnostic.config({ virtual_text = false , 
						signs = false })

-- default style for status line
lvim.builtin.lualine.style = "default"

-- set status line theme
lvim.builtin.lualine.options.theme = "gruvbox"

-- disable indentation lines
lvim.builtin.indentlines.active = false


-- theme config 

-- bold function names
vim.g.gruvbox_material_enable_bold=1
vim.g.gruvbox_material_background="soft"



vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines
vim.opt.nuw = 2 
-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- exec vim script
-- vim.api.nvim_exec([[
-- Plug 'kovetskiy/sxhkd-vim'
-- ]], false)
-- vim.g.maplocalleader = '`'
-- require('lean').setup{
--   lsp = { on_attach = on_attach },
--   mappings = true,
-- }
