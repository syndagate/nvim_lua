local wk = require("which-key")

vim.keymap.set('n', '<leader>h', '<cmd>noh<cr>', { desc = 'disable word highlight'})
vim.keymap.set('n', '<leader>q', '<cmd>q!<cr>', { desc = 'close', silent = false })
vim.keymap.set('n', '<leader>Q', '<cmd>qa!<cr>', { desc = 'close all', silent = false })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'save', silent = false })
vim.keymap.set('n', '<leader>z', '<cmd>wq<cr>', { desc = 'save and close', silent = false })
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "open URL under cursor", silent = true })
vim.keymap.set("n", "<F4>", function()
    vim.cmd("w!")
    vim.cmd("source %")
end, { desc = "write file and source it", silent = false })

-- Terminal
function _G.set_terminal_keymaps()
    vim.keymap.set('t', '<esc>', "<C-\\><C-n>", { buffer = 0 })
    vim.keymap.set('t', '<esc><esc>', "<C-\\><C-n><cmd>ToggleTerm<cr>", { buffer = 0 })
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
wk.register({
    t = {
        desc = "Terminal",
        f = {"<cmd>ToggleTerm direction=float<cr>", "open a float terminal"},
        b = {"<cmd>ToggleTerm direction=horizontal size=80<cr>", "open a terminal at the bottom"},
        r = {"<cmd>ToggleTerm direction=vertical size=80<cr>", "open a terminal to the right"},
    }
},{ prefix = "<leader>" })

-- Split window management
wk.register({
    s = {
        desc = "Split Window",
        v = { "<C-w>v", "split window vertically" },
        h = { "<C-w>s", "split window horizontally" },
        e = { "<C-w>=", "make split windows equal width" },
        q = { "<cmd>close<cr>", "close split window" },
    }
},{ prefix = "<leader>" })
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

-- buffer handling
wk.register({
    b = {
        desc = "Buffer actions",
        n = { "<cmd>bn<cr>", "switch to next buffer" },
        p = { "<cmd>bp<cr>", "switch to previous buffer" },
        d = { "<cmd>bd<cr>", "delete/close buffer" },
    },
},{ prefix = "<leader>"})

-- git --
wk.register({
    g = {
        desc = "Git",
        b = { "<cmd>GitBlameToggle<cr>", "toogle blame" },
        s = { "<cmd>TermExec cmd=\"git status\"<cr>", "status" },
        l = { "<cmd>TermExec cmd=\"git log\"<cr>", "log" },
    },
},{ prefix = "<leader>"})

-- nvim-tree
wk.register({
    e = {
        desc = "Tree",
        e = { "<cmd>NvimTreeToggle<cr>", "open nvim tree" },
        r = { "<cmd>NvimTreeFocus<cr>", "focus nvim tree" },
        f = { "<cmd>NvimTreeFindFile<cr>", "find file in nvim tree" },
    },
},{ prefix = "<leader>" })

-- telescope --
local bi = require("telescope.builtin")
wk.register({
    f = {
        desc = "Telescope (Files,Buffer,Help...)",
        f = { bi.find_files, "find files" },
        c = { function() bi.find_files { cwd = "~/.config/nvim" } end, "find nvim config files" },
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
            i = { vim.lsp.buf.implementation, "implementation", buffer = buffer_number },
            f = { require('telescope.builtin').lsp_references, "goto reference", buffer = buffer_number },
            b = { require('telescope.builtin').lsp_document_symbols, "buffer symbols", buffer = buffer_number },
        },
    },{ prefix = "<leader>" })
end
return M

