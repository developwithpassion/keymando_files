class SystemPlugin < Plugin
  requires_version '1.1.4'
end

def change_volume(value)
  `osascript -e 'set volume output volume (output volume of (get volume settings) #{value})'`
end

command "Volume Up" do
  change_volume '+ 7'
end

command "Volume Down" do
  change_volume '- 7'
end
