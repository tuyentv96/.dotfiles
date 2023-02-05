version = '0.20.2'

xplr.fn.custom.nvim_ctrl = function(app)
    local n = app.focused_node
    if n == nil then
      return
    end

    local res = xplr.util.shell_execute("bash", {"-c", 'tmux send-keys -t "top-left" ":o ' .. n.absolute_path .. '" Enter;'})

    if res.returncode == 0 then
      return {
        { LogSuccess = "hx :" .. q(n.absolute_path) },
      }
    else
      return {
        { LogError = res.stderr },
      }
    end
  end

xplr.config.modes.builtin.default.key_bindings.on_key["o"] = {
    help = "hx open:",
    messages = {
      "PopMode",
      { CallLuaSilently = "custom.nvim_ctrl"},
    },
}
