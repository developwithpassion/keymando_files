class GoodSync < Plugin
  requires_version '1.1.4'
end

command "GoodSync Sync" do
  app = Accessibility::Gateway.get_application_by_name "GoodSync"
  job_menu = app.menu_bar.find.first_item_matching(:role => Matches.partial("menubaritem"), :title => Matches.exact("Job")).find
  menu_item = job_menu.first_item_matching(:role => Matches.partial("menuitem"),:title => Matches.exact("Analyze and Sync All"))
  menu_item.press
end
