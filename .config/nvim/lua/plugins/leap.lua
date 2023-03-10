local omnileap = function ()
    require('leap').leap { target_windows = vim.tbl_filter(
        function (win) return vim.api.nvim_win_get_config(win).focusable end,
        vim.api.nvim_tabpage_list_wins(0)
    )}
end
return {
    "ggandor/leap.nvim",

    keys = {
        { "s", mode = { "n", "x", "o" }, desc = "Leap", omnileap},
        --   { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
        --   { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
        --   { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
        local leap = require("leap")
        for k, v in pairs(opts) do
            leap.opts[k] = v
        end
        leap.add_default_mappings(false)
        -- vim.keymap.del({ "x", "o" }, "x")
        -- vim.keymap.del({ "x", "o" }, "X")
    end,
}
