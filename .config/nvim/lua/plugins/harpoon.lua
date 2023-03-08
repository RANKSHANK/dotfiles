return {
    "ThePrimeagen/harpoon",
    lazy = true,
    keys = {
        { "<leader>uh", function () require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon UI" },
        { "<leader>hu", function () require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon UI" },
        { "<leader>ha", function () require("harpoon.mark").add_file() end, desc = "Harpoon Add File" },
        { "<leader>h1", function () require("harpoon.ui").nav_file(1) end,desc = "Harpoon File 1" },
        { "<leader>h2", function () require("harpoon.ui").nav_file(2) end,desc = "Harpoon File 2" },
        { "<leader>h3", function () require("harpoon.ui").nav_file(3) end,desc = "Harpoon File 3" },
        { "<leader>h4", function () require("harpoon.ui").nav_file(4) end,desc = "Harpoon File 4" },
    },
    opts = {
        global_settings = {
            mark_branch = true,
        },
        projects = {
        }
    }
}
