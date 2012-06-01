toggle "<Cmd-9>"
map "<Cmd-e>", "<Escape>"
map "<Cmd-Shift-d>", "<Cmd-Shift-Tab>"
map "<Cmd-d>", Commands[:current_app_windows]
map "<Cmd-f>", Commands[:trigger_app]
map "<Cmd-Shift-f>", "<Cmd-Tab>"
map "<Cmd-h>", "<Left>"
map "<Cmd-j>", "<Down>"
map "<Cmd-k>", "<Up>"
map "<Cmd-l>", "<Right>"
map "<Cmd-m>", "<Tab>"
map "<Cmd-,>", "<Shift-Tab>"
map "<Cmd-n>", "<Ctrl-n>"
map "<Cmd-r>", Commands[:right_click]
map "<Cmd-0>", "<Cmd-Shift-D>"
map "<Cmd-o>", RunLastCommand.instance
map "<Cmd- >", Commands[:launch_app]
map "<Cmd-i>", Commands[:run_history_item]
map "<Cmd-p>", UiControls.instance
map "<Cmd-y>", Commands[:run_registered_command]

%w/q w/.each do|key|
  map "<Cmd-#{key}>",noop
end
