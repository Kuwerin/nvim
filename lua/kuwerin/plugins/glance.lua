-- Glance setup.
local glance = require 'glance'

glance.setup({
  border = {
    enable = true, -- Show window borders. Only horizontal borders allowed
    top_char = '―',
    bottom_char = '―',
  }
})
