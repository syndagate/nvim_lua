local wk = require("which-key")

vim.keymap.set('n', '<leader>h', '<cmd>noh<cr>', { desc = 'disable word highlight'})
vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', { desc = 'toogle terminal'})
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'close', silent = false })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'save', silent = false })
vim.keymap.set('n', '<leader>z', '<cmd>wq<cr>', { desc = 'save and close', silent = false })

-- Split window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
vim.keymap.set("n", "<C-Down>", "<C-w>-") -- make split window height shorter
vim.keymap.set("n", "<C-Up>", "<C-w>+") -- make split windows height taller
vim.keymap.set("n", "<C-Left>", "<C-w>>5") -- make split windows width bigger
vim.keymap.set("n", "<C-Right>", "<C-w><5") -- make split wicdows width smaller
vim.keymap.set("n", "<M-Right>", "<C-w>l") -- switch to right split window
vim.keymap.set("n", "<M-l>", "<C-w>l") -- switch to right split window
vim.keymap.set("n", "<M-Left>", "<C-w>h") -- switch to left split window
vim.keymap.set("n", "<M-h>", "<C-w>h") -- switch to left split window


vim.keymap.set("n", "<M-Up>", "<C-w>k") -- switch to upper split window
vim.keymap.set("n", "<M-k>", "<C-w>k") -- switch to upper split window
vim.keymap.set("n", "<M-Down>", "<C-w>j") -- switch to lower split window
vim.keymap.set("n", "<M-j>", "<C-w>j") -- switch to lower split window

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- telescope --
local bi = require("telescope.builtin")
wk.register({
    f = {
        desc = "Telescope (Files,Buffer,Help...)",
        f = { bi.find_files, "find files" },
        s = { bi.grep_string, "grep string under cursor" },
        r = { bi.live_grep, "grep" },
        h = { bi.help_tags, "find help tags" },
        k = { bi.keymaps, "find key maps" },
        b = { bi.buffers, "find buffers" },
    },
},{ prefix = "<leader>"})

-- lsp --
local M = {}
M.map_lsp_keybinds = function(buffer_number)
    wk.register({
        l = {
            desc = "LSP (Rename,CodeAction,Goto...)",
            r = { vim.lsp.buf.rename, "rename", buffer = buffer_number },
            c = { vim.lsp.buf.code_action, "code action", buffer = buffer_number },
            d = { vim.lsp.buf.definition, "definition", buffer = buffer_number },
            e = { vim.lsp.buf.declaration, "decleration", buffer = buffer_number },
            h = { vim.lsp.buf.hover, "hover documentation", buffer = buffer_number },
            f = { require('telescope.builtin').lsp_references, "goto reference", buffer = buffer_number },
            b = { require('telescope.builtin').lsp_document_symbols, "buffer symbols", buffer = buffer_number },
        },
    },{ prefix = "<leader>" })
end
return M

