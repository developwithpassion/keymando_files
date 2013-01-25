class GoToMeeting < Plugin
  requires_version '1.1.4'
end

def goto_meeting
  Accessibility::Gateway.get_application_by_partial_name "GoToMeeting"
end

command "GoToMeeting Login" do
  sheet = goto_meeting.main_window.find.first_item_matching(:role => Matches.partial("sheet"))
  search = sheet.find
  search.first_item_matching(:role => Matches.partial("textfield"),:description => Matches.exact("Login Email Text Field")).value = "jp@developwithpassion.com"
  password = search.first_item_matching(:role => Matches.partial("textfield"),:description => Matches.exact("Login Password Text Field"))
  password.focused = true
  send_keys(@@passwords[:gotomeeting]).run
  search.first_item_matching(:role => Matches.partial("button"),:title => Matches.exact("Login")).press
end


def get_grab_tab_button(button_title)
  grab_window = goto_meeting.find.first_item_matching(:role => Matches.partial("window"),:title => Matches.exact("GrabTab"))
  return grab_window.find.first_item_matching(:role => Matches.partial("checkbox"),
   :description => Matches.exact(button_title))
end

def get_standard_window_button(button_description)
  return goto_meeting.main_window.find.first_item_matching(:role => Matches.partial("button"),:description => Matches.exact(button_description))
end

def grab_tab_button_press(command_description,button_title)
  command command_description do
    get_grab_tab_button(button_title).press
  end
end

def standard_window_button_press(description,button_description)
  command description do
    get_standard_window_button(button_description).press
  end
end

command "GoToMeeting Share My WebCam" do
  goto_meeting.main_window.find.first_item_matching(:role => Matches.partial("busyindicator"),:identifier => Matches.exact("_NS:43")).click_center
end

command "GoToMeeting Make Presenter" do
  get_grab_tab_button("Grab Tab CP Button").click_center
end

def screen_share(screen_description)
  command "GotoMeeting Share #{screen_description}" do
    search = goto_meeting.main_window.find
    search.first_item_matching(:role => Matches.partial("popup"),:description => Matches.exact("Screen Sharing Screen Selector")).press
    search.first_item_matching(:role => Matches.partial("menuitem"),:title => Matches.exact(screen_description)).press
  end
end


grab_tab_button_press("GoToMeeting Mute Me","Grab Tab Mute Button")
grab_tab_button_press("GoToMeeting Screen Share","Grab Tab Stop Button")
standard_window_button_press("GoToMeeting Mute All Attendess","Attendee List Mute All Button")
standard_window_button_press("GoToMeeting Unmute All Attendess","Attendee List Unmute All Button")

["Main Screen","All Screens"].each{|item| screen_share(item)}
(2..(NSScreen.screens.count)).each{|item| screen_share("Screen #{item}")}
