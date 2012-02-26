def new_screen_position(args)
  Command.to_run :description => "Window - Move to #{args[:position]}" do
    add Accessibility::MoveWindow.new(:frame_calculation => args[:frame_calculation])
  end
end

new_screen_position(:position => "Full Screen",:frame_calculation => Accessibility::FullScreenFrameCalculation.new)
new_screen_position(:position => "Top Left",:frame_calculation => Accessibility::TopLeftFrameCalculation.new)
new_screen_position(:position => "Top Right",:frame_calculation => Accessibility::TopRightFrameCalculation.new)
new_screen_position(:position => "Bottom Left",:frame_calculation => Accessibility::BottomLeftFrameCalculation.new)
new_screen_position(:position => "Bottom Right",:frame_calculation => Accessibility::BottomRightFrameCalculation.new)
new_screen_position(:position => "Left",:frame_calculation => Accessibility::LeftFrameCalculation.new)
new_screen_position(:position => "Right",:frame_calculation => Accessibility::RightFrameCalculation.new)
new_screen_position(:position => "Bottom",:frame_calculation => Accessibility::BottomFrameCalculation.new)
new_screen_position(:position => "Top",:frame_calculation => Accessibility::TopFrameCalculation.new)
new_screen_position(:position => "Center",:frame_calculation => Accessibility::CenterScreenFrameCalculation.new)

