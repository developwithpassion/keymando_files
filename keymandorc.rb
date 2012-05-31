toggle "<Cmd-9>"
map "<Cmd-e>", "<Escape>"
map "<Cmd-Shift-d>", "<Cmd-Shift-Tab>"
map "<Cmd-d>", Commands.find_by_key(:current_app_windows)
map "<Cmd-f>", Commands.find_by_key(:trigger_app)
map "<Cmd-Shift-f>", "<Cmd-Tab>"
map "<Cmd-h>", "<Left>"
map "<Cmd-j>", "<Down>"
map "<Cmd-k>", "<Up>"
map "<Cmd-l>", "<Right>"
map "<Cmd-m>", "<Tab>"
map "<Cmd-,>", "<Shift-Tab>"
map "<Cmd-n>", "<Ctrl-n>"
map "<Cmd-r>", Commands.find_by_key(:right_click)
map "<Cmd-0>", "<Cmd-Shift-D>"
map "<Cmd-o>", Commands.find_by_key(:run_last_command)
map "<Cmd- >", Commands.find_by_key(:launch_app)
map "<Cmd-i>", Commands.find_by_key(:run_history_item)
map "<Cmd-p>", UiControls.instance
map "<Cmd-y>", Commands.find_by_key(:run_registered_command)

%w/q w/.each do|key|
  map "<Cmd-#{key}>",noop
end
