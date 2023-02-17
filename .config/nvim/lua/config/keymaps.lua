local opts = {
  noremap = true,
  silent  = true,
}

local term_opts = {
  silent = true,
}

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)


-- Normal mode
  -- Window navigation
    keymap("n", "<C-h>", "<C-w>h", opts)
    keymap("n", "<C-j>", "<C-w>j", opts)
    keymap("n", "<C-k>", "<C-w>k", opts)
    keymap("n", "<C-l>", "<C-w>l", opts)
  -- Buffer navigation
    keymap("n", "<S-l>", ":bnext<CR>", opts)
    keymap("n", "<S-h>", ":bprevious<CR>", opts)
  -- Move text
    keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
    keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
  -- File Explorer
    keymap("n", "<leader>e", ":Lex<CR>", opts)

-- Insert mode
    keymap("n", "jkjk", "<ESC>", opts)
    keymap("n", "kjkj", "<ESC>", opts)
    keymap("n", "jkkj", "<ESC>", opts)
    keymap("n", "kjjk", "<ESC>", opts)

-- Visual Mode
  -- Remain in indent mode
    keymap("v", "<", "<gv", opts)
    keymap("v", ">", ">gv", opts)
  -- Move text up and down
    keymap("v", "<A-j>", ":m .+1<CR>==", opts)
    keymap("v", "<A-k>", ":m .-2<CR>==", opts)
    keymap("v", "p", '"_dP', opts)
  -- File Explorer
    keymap("v", "<leader>e", ":Lex<CR>", opts)
    
-- Visual Block Mode

-- Visual Block --
  -- Move text up and down
    keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
    keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
    keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
    keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal Mode
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
