class Firefox < Plugin
  requires_version '1.1.4'
end

command "Pentadactyl Passthrough Mode" do
  send_keys("<Shift-Escape>").run
end
