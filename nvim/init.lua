vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
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
    { src = 'https://github.com/luisiacc/gruvbox-baby' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
})

vim.g.gruvbox_baby_transparent_mode = 1
vim.cmd("colorscheme gruvbox-baby")

require('mason').setup()
require('mason-lspconfig').setup()
require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "python", "cpp", "javascript", "html", "css", "php", "sql" },
  highlight = { enable = true },
  indent = { enable = true },
})

-- FZF Lua setup
local fzf = require('fzf-lua')

require("fzf-lua").setup({
  winopts = {
    fullscreen = true,
    border = "none",
    preview = {
      layout = "vertical",
      vertical = "up:50%",
    },
  },
  fzf_opts = {
    ["--info"] = "inline",
    ["--layout"] = "reverse",
  },
})

vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'Switch buffers' })
vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = 'Find help' })
