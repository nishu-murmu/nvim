return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local status_ok, mark = pcall(require, "harpoon.mark")
        if not status_ok then
            return
        end
        local status_ok1, ui = pcall(require, "harpoon.ui")
        if not status_ok1 then
            return
        end

        if status_ok and status_ok1 then
            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<leader>l", ui.toggle_quick_menu)
            vim.keymap.set("n", "<M-1>", function()
                ui.nav_file(1)
            end)
            vim.keymap.set("n", "<M-2>", function()
                ui.nav_file(2)
            end)
            vim.keymap.set("n", "<M-3>", function()
                ui.nav_file(3)
            end)
            vim.keymap.set("n", "<M-4>", function()
                ui.nav_file(4)
            end)
        end
    end,
}
