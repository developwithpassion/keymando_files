class Skype < Plugin
  requires_version '1.1.7'
end

def press_call_phone_button
  app = Accessibility::Gateway.get_application_by_name "skype"
  app.front_most = true
  call_phone = app.main_window.find.first_item_matching(:role => Matches.partial("button"),:description => Matches.exact("Dial Pad"))
  call_phone.press
  return :app => app,:success => call_phone != nil
end

command "Skype Call Phones - My Numbers" do
  result = press_call_phone_button
  trigger_item_with(@@phone_numbers,CallPhone.new(result[:app])) if result[:success]
end

command "Skype Call Phones" do
  number = prompt("Which Number?")
  if number != nil
    result = press_call_phone_button
    CallPhone.new(result[:app]).run_using(PhoneNumber.new(number,"")) if result[:success]
  end
end

command "Skype Hang Up" do
  app = Accessibility::Gateway.get_application_by_name "skype"
  app.front_most = true
  hang_up = app.menu_bar.find.first_item_matching(:role => Matches.partial("menuitem"),:title => Matches.partial("hang up"))
  hang_up.press
end

command "Skype Login" do
  app = Accessibility::Gateway.get_application_by_name "skype"
  unless app == nil
    app.front_most = true
    search = app.focused_window.find
    password = search.first_item_matching(:role => Matches.partial("textfield"))
    user_name = search.first_item_matching(:role => Matches.partial("combobox"))
    user_name.focused = true
    user_name.value = ""
    send_keys("jpboodhoo").run
    sleep(1)
    password.focused = true
    send_keys(@@passwords[:skype]).run
    sleep(1)
    search.first_item_matching(:role => Matches.partial("button"),:title => Matches.exact("Sign me in")).press
  end
end
