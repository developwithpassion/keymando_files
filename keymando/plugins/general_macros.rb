command "Window hide current" do
  send_keys("<Cmd-w>").run
end

command "Quit current application" do
  send_keys("<Cmd-q>").run
end

command "Quicksilver" do
  send_keys_and_pause("<Cmd-1>").run
end
