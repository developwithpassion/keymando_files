Command.define "GMail Send New Mail" do
  add send_keys("<Shift-Tab>" * 6)
end

Command.define "GMail Send Reply Mail" do
  add send_keys("<Shift-Tab>" * 5)
end

Command.define "GMail Discard New Mail" do
  add send_keys("<Shift-Tab>" * 4)
end

Command.define "GMail Discard Reply Mail" do
  add send_keys("<Shift-Tab>" * 3)
end
