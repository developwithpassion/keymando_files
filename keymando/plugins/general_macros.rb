command "Window hide current" do
  send_keys("<Cmd-w>").run
end

command "Quit current application" do
  send_keys("<Cmd-q>").run
end

command "Quicksilver" do
  send_keys_and_pause("<Cmd-1>").run
end

class PickAFile
  def run_using(item)
    MessageBoard.display.sucess_message(item.to_s)
  end
end
command "Pick a file" do
  files = Finder.find("/",:extension => "",:max_depth => 6)
  trigger_item_with(files,PickAFile.new)
end
