include AccessibilityUtility
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

Command.to_run :description => "Quicksilver" do
  add send_keys_and_pause("<Cmd-1>")
end

Command.to_run :description => "Show current app menu items" do
  add_block do
    app = Accessibility::Gateway.get_active_application
    app.front_most = true
    trigger_item_with(app.all_menu_items,RunMenuItem.new)
  end
end

Command.to_run :description => "Show current app windows",:key => :current_app_windows do
  add_block do
    app = Accessibility::Gateway.get_active_application
    index = 0
    windows = app.windows.map{|item| index+=1;DisplayItem.new(item,"#{index} - #{item.title}")}.to_a
    trigger_item_with(windows,RaiseWindow.new)
  end
end

Command.to_run :description => "Run Registered Command",:key => :run_registered_command do
  add_block do
    trigger_item_with(Commands.items.dup,RunACommand.new)
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

Command.to_run :description => "Focus Application",:key => :trigger_app do
  add_block do
    apps = NSWorkspace.sharedWorkspace.runningApplications.select{|app| app.activationPolicy == NSApplicationActivationPolicyRegular}.map{|app| DisplayItem.new(app,"#{app.localizedName}")}.to_a
    trigger_item_with(apps,FocusApp.new)
  end
end
