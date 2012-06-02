Command.define "Window hide current" do
  add send_keys("<Cmd-w>")
end

Command.define "Quit current application" do
  add send_keys("<Cmd-q>")
end

Command.define "Quicksilver" do
  add send_keys_and_pause("<Cmd-1>")
end
