return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
        { "<leader>gD", "<cmd>Gdiffsplit!<cr>", desc = "Git diff 3-way-split" },
        { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
        { "<leader>gC", "<cmd>Git commit --amend<cr>", desc = "Git commit --amend" },
        { "<leader>gl", "<cmd>GcLog -50<cr>", desc = "Git log last 50 commits" },
        { "<leader>gp", "<cmd>Git pull<cr>", desc = "Git pull" },
        { "<leader>gS", "<cmd>Git stash --all<cr>", desc = "Git stash --all" },
    },
}
