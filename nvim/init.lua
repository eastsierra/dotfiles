vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 6
vim.opt.termguicolors = true
-- vim.opt.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- searching vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- misc keymaps
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
vim.keymap.set({ "n", "v", "x" }, "<leader>n", ":norm ")
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- plugins
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/luisiacc/gruvbox-baby" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
})

vim.g.gruvbox_baby_transparent_mode = 1
vim.cmd("colorscheme gruvbox-baby")
vim.cmd(":hi statusline guibg=NONE")

require("mason").setup()
require("mason-lspconfig").setup()

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"python",
		"javascript",
		"typescript",
		"html",
		"css",
		"cpp",
		"php",
		"sql",
		"json",
		"bash",
		"markdown",
		"markdown_inline",
	},
	highlight = { enable = true },
})

local fzf = require("fzf-lua")

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

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fl", fzf.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Find help" })

-- formatter
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		php = { "php_cs_fixer" },
		cpp = { "clang_format" },
		sql = { "sqlfluff" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.keymap.set("n", "<leader>fo", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format code" })

require("oil").setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open file explorer" })

require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},
	completion = {
		documentation = { auto_show = false },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
})

require("nvim-autopairs").setup()
