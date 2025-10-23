vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.swapfile = false
vim.opt.backup = false

-- tabs & indents
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.linebreak = true
vim.opt.breakindent = true

-- gj/gk aware
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- highlights everything
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- clears pesky search highlights
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- drag line with alt  
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- drag highlighted lines with alt
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- plugins
vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/vague-theme/vague.nvim' },
})

require('mason').setup()
require('mason-lspconfig').setup()

-- transparent background
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi FloatBorder guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi CursorLineNr guibg=NONE ctermbg=NONE
      hi FoldColumn guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi DiagnosticFloatingError guibg=NONE ctermbg=NONE
      hi DiagnosticFloatingWarn guibg=NONE ctermbg=NONE
      hi DiagnosticFloatingInfo guibg=NONE ctermbg=NONE
      hi DiagnosticFloatingHint guibg=NONE ctermbg=NONE
    ]])
  end,
})

vim.cmd("colorscheme vague")
