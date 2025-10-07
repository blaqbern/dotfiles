vim.pack.add { "https://github.com/nvim-lualine/lualine.nvim.git" }

local palette = require("blaqbern.palettes").setup "amaro"

local buffers = {
  "buffers",
  show_filename_only = false,
  show_modified_status = true,
  mode = 0,
  buffers_color = { active = "TablineSel", inactive = "Tabline" },
  symbols = { modified = " ⊙", alternate_file = "" },
}
local location = {
  "location",
  color = { bg = palette.bg_dark3, fg = palette.bg_light2 },
}

require("lualine").setup {
  options = {
    icons_enabled = false,
    theme = "auto",
    section_separators = "",
    component_separators = "",
    always_divide_middle = false,
  },
  inactive_sections = {},
  sections = {
    lualine_a = { buffers },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { location },
  },
}
