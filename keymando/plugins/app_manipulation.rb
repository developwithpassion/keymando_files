require 'find'

def find_all_items(path,extension,depth = 2)
  items = IO.popen("find #{path} -type d -iname '*#{extension}' -maxdepth #{depth}").lines.each do|app|
    the_app = app.chomp
    name = File.basename(the_app)
    yield DisplayItem.new(the_app,File.basename(the_app).gsub(extension,""))
  end
end

Command.to_run :description => "Launch Preference Pane" do
  prefs = []
  find_all_items("/System/Library/PreferencePanes",'.prefPane'){|item| prefs << item}

  add_block do
    trigger_item_with(prefs,LaunchItem.new)
  end
end


Command.to_run :description => 'Launch Application',:key => :launch_app do
  apps = []
  ["/Applications", "/Developer/Applications","/System/Library/CoreServices"].each do|catalog|
    find_all_items(catalog,".app",3){|item| apps << item}
  end
  add_block do
    trigger_item_with(apps,LaunchApp.new)
  end
end

