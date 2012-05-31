Command.to_run :description => "Run history item",:key => :run_history_item do
  add_block do
    if CommandHistory.instance.has_items? 
      items = CommandHistory.instance.to_a
      trigger_item_with(items,RunACommand.new)
    end
  end
end

Command.to_run :description => "Run the last command that was run", :key => :run_last_command do
  add_block do
    if CommandHistory.instance.has_items?
      CommandHistory.instance.first.run
    end
  end
end

Command.to_run :description => 'Double Click',:key => :double_click do
  add_block do 
    MouseMacros.create_mouse_event_factory(:button_group > MouseButtonEventsGroupFactory.create_left_button_events_group).double_click.run
  end
end

Command.to_run :description => 'Left Click',:key => :left_click do
  add_block do
    MouseMacros.left_click
  end
end

Command.to_run :description => 'Lock the screen' do
  add_block do
    system('/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend')
  end
end

Command.to_run :description => 'Previous application' do
  add_block do
    KeyPressMacros.key_press_for KeyCodeMapper.map_sequence("<Cmd-Shift-Tab>")
  end
end

Command.to_run :description => 'Right Click',:key => :right_click do
  add_block do
    MouseMacros.right_click
  end
end
