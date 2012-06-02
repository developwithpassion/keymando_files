toggle "<Cmd-9>"
map "<Cmd-q>", noop
map "<Cmd-w>", noop

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
map "<Cmd-o>", Commands[:run_last_command]
map "<Cmd- >", Commands[:run_registered_command]
map "<Cmd-i>", Commands[:run_history_item]
map "<Cmd-p>", Commands[:press_button_on_ui]

map ";uic", Commands[:ui_controls]
map ";lc", Commands[:left_click_element]
map ";rc", Commands[:right_click_element]
map ";dc", Commands[:double_click_element]
map ";mi", Commands[:show_current_app_menu_items]

ApplicationLauncher.register('/Applications')
ApplicationLauncher.register('/System/Library/CoreServices')
ApplicationLauncher.register('/System/Library/PreferencePanes',:extension => '.prefPane')
