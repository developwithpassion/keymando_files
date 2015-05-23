class ITerm < Plugin
  requires_version '1.1.4'
end
 
def iterm_button(name_reg_ex)
  app = Accessibility::Gateway.get_application_by_name "iterm"
  button = app.menu_bar.find.first_item_matching(:title => Matches.regex(name_reg_ex))
  button
end

def iterm_command_for_button(name,name_reg_ex)
  command name do
    iterm_button(name_reg_ex).press
  end
end

iterm_command_for_button("New ITerm Window",/^New\sWindow/i)
