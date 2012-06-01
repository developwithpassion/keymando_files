Command.to_run :description => "GMail Send New Mail" do
  add send_keys("<Shift-Tab>" * 6)
end

Command.to_run :description => "GMail Send Reply Mail" do
  add send_keys("<Shift-Tab>" * 5)
end

Command.to_run :description => "GMail Discard New Mail" do
  add send_keys("<Shift-Tab>" * 4)
end

Command.to_run :description => "GMail Discard Reply Mail" do
  add send_keys("<Shift-Tab>" * 3)
end
