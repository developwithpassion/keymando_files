class GeneralMacros < Plugin
  requires_version '1.1.4'
end

command "Toggle the dock" do
  send_keys("<Cmd-Option-d>").run
end

command "Window hide current" do
  send_keys("<Cmd-w>").run
end

command "Quit current application" do
  send_keys("<Cmd-q>").run
end

command "Quicksilver" do
  send_keys_and_pause("<Cmd-;>").run
end
