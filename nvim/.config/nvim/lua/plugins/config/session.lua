require("core.utils")

-- For a better experience with the plugin overall using this config for sessionoptions is recommended.
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require("auto-session").setup {
  log_level = "error",
  auto_save_enabled = true,
  auto_restore_enabled = true,
  cwd_change_handling = {
    restore_upcoming_session = true, 
    pre_cwd_changed_hook = nil,
    post_cwd_changed_hook = function()
      vim.diagnostic.reset()
      pcall(require'metals'.restart_server)
    end,
  },
  -- presave_cmds = function()
  -- end
  -- auto_session_allowed_dirs = {"~/projects/*", "~/notes"}
}

nnoremap("<c-s>", ":Autosession search<CR>")
