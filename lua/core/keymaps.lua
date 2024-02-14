local wk = require("which-key")

vim.keymap.set('n', '<leader>h', '<cmd>noh<cr>', { desc = 'disable word highlight'})
vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', { desc = 'toogle terminal'})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

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

-- toggleterm --
--local tt = require("toggleterm")
--wk.register({
--    t = {
--        desc = "Toggleterm",
--        t = { tt.toggle(), "toggle terminal" }
--    },
--},{ prefix = "leader" })

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

