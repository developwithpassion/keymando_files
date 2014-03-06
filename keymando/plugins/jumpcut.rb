class Jumpcut < Plugin
  requires_version '1.1.4'
end
 
command 'Jumpcut' do
  send_keys("<Ctrl-Option-v>").run
end
