framework 'Foundation'
framework 'ScriptingBridge'

class ITunes < Plugin
  requires_version '1.1.7'
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

class Track
  attr_accessor :track
  def initialize(track)
    @track = track
  end
  def to_s
    return @track.name
  end
end

command "Browse Tracks" do
  itunes = SBApplication.applicationWithBundleIdentifier("com.apple.iTunes")
  library = itunes.sources.find{|s| s.name == "Library"}.playlists.find{|list| list.name == "Music"}
  tracks = library.tracks.map{|track| Track.new(track)}.to_a
  trigger_item_with(tracks,PlayTrack.new)
end

itunes_command_for_button("iTunes Play",/Play\s*space/)
itunes_command_for_button("iTunes Pause",/Pause\s*space/)
itunes_command_for_button("iTunes Stop",/Stop\s*space/)
itunes_command_for_button("iTunes Previous Song",/Previous/)
itunes_command_for_button("iTunes Next Song",/Next/)
itunes_command_for_button("iTunes Increase Volume",/Increase Volume/)
itunes_command_for_button("Decrease iTunes Volume",/Decrease Volume/)

