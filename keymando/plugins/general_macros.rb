Command.to_run :description => "Window hide current" do
  add send_keys("<Cmd-w>")
end

Command.to_run :description => "Quit current application" do
  add send_keys("<Cmd-q>")
end
