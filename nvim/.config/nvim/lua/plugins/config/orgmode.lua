require('orgmode').setup({
    org_agenda_files       = { "~/notes/agenda/**/*" },
    org_default_notes_file = "~/notes/refile.org",
    diagnostics            = false,
    org_priority_highest   = 1,
    org_priority_lowest    = 5,
    org_priority_default   = 3,
})
