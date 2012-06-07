class Firefox < Plugin
  requires_version '1.1.7'
end

command "Pentadactyl Passthrough Mode" do
  send_keys("<Ctrl-z>").run
end
