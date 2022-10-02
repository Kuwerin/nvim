-- Org mode
local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = '~/Documents/work/*',
  org_default_notes_file = '~/Documents/work/agenda.org',
})
