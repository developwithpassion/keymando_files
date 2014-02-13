class ITunes < Plugin
  requires_version '1.1.4'
end
 
def itunes_button(name_reg_ex)
  app = Accessibility::Gateway.get_application_by_name "itunes"
  button = app.menu_bar.find.first_item_matching(:title => Matches.regex(name_reg_ex))
  return button
end

def itunes_command_for_button(name,name_reg_ex)
  command name do
    itunes_button(name_reg_ex).press
  end
end

class PlayTrack
  def run_using(item)
    item.original.playOnce(true)
  end
end

command "Browse Tracks" do
  itunes = SBApplication.applicationWithBundleIdentifier("com.apple.iTunes")
  library = itunes.sources.find{|s| s.name == "Library"}.playlists.find{|list| list.name == "Music"}
  tracks = library.tracks.map{|track| DisplayItem.new(track,track.name)}.to_a
  trigger_item_with(tracks,PlayTrack.new)
end

itunes_command_for_button("iTunes Play",/Play\s*space/)
itunes_command_for_button("iTunes Pause",/Pause\s*space/)
itunes_command_for_button("iTunes Stop",/Stop\s*space/)
itunes_command_for_button("iTunes Previous Song",/^Previous/)
itunes_command_for_button("iTunes Next Song",/^Next/)
itunes_command_for_button("iTunes Increase Volume",/Increase Volume/)
itunes_command_for_button("Decrease iTunes Volume",/Decrease Volume/)

