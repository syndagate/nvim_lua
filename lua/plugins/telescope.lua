return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function ()
        require("telescope").setup({
            defaults = {
                "vendor",
                ".git"
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        })
        pcall(require('telescope').load_extension, 'ui-select')
    end,
}
