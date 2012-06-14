class GMail < Plugin
  requires_version '1.1.4'
end

command "GMail Send New Mail" do
  send_keys("<Shift-Tab>" * 6).run
end

command "GMail Send Reply Mail" do
  send_keys("<Shift-Tab>" * 5).run
end

command "GMail Discard New Mail" do
  send_keys("<Shift-Tab>" * 4).run
end

command "GMail Discard Reply Mail" do
  send_keys("<Shift-Tab>" * 3).run
end
