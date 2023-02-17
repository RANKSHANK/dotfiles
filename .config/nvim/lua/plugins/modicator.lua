return { "mawkler/modicator.nvim",
  dependencies = {
    "nvim-lualine/lualine.nvim",
  },
  init = function()
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  config = function()
    local utils = require("lualine.utils.utils")
    local colors = {
      normal  = utils.extract_color_from_hllist('bg', { 'PmenuSel', 'PmenuThumb', 'TabLineSel' }, '#000000'),
      insert  = utils.extract_color_from_hllist('fg', { 'String', 'MoreMsg' }, '#000000'),
      replace = utils.extract_color_from_hllist('fg', { 'Number', 'Type' }, '#000000'),
      visual  = utils.extract_color_from_hllist('fg', { 'Special', 'Boolean', 'Constant' }, '#000000'),
      command = utils.extract_color_from_hllist('fg', { 'Identifier' }, '#000000'),
      back1   = utils.extract_color_from_hllist('bg', { 'Normal', 'StatusLineNC' }, '#000000'),
      fore    = utils.extract_color_from_hllist('fg', { 'Normal', 'StatusLine' }, '#000000'),
      back2   = utils.extract_color_from_hllist('bg', { 'StatusLine' }, '#000000'),
    }
    require("modicator").setup({
      show_warnings = true,
      highlights = {
        -- Color and bold/italic options for each mode. You can add a bold and/or
        -- italic key pair to override the default highlight for a specific mode if
        -- you would like.
        modes = {
          ['n'] = {
            foreground = colors.normal,
          },
          ['i']  = {
            foreground = colors.insert,
          },
          ['v']  = {
            foreground = colors.visual,
          },
          ['V']  = {
            foreground = colors.visual,
          },
          ['�'] = { -- This symbol is the ^V character
            foreground = colors.visual,
          },
          ['s']  = {
            foreground = colors.visual,
          },
          ['S']  = {
            foreground = colors.visual,
          },
          ['R']  = {
            foreground = colors.replace,
          },
          ['c']  = {
            foreground = colors.command,
          },
        },
      }
    })
  end,
}
