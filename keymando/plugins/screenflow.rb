class ScreenFlow < Plugin
  requires_version '1.1.7'
end

command "Screenflow Stop Recording" do
  send_keys("<Cmd-Shift-2>").run
end

command "Screenflow Start New Recording" do
  app = Accessibility::Gateway.get_application_by_name "ScreenFlow"
  app.menu_bar.find.first_item_matching(:role => Matches.partial("menuitem"), :title => Matches.regex(/New Recording/)).press
  sleep(1)
  helper = Accessibility::Gateway.get_application_by_name "ScreenFlowHelper"
  window = helper.find.first_item_matching(:role => Matches.partial("window"),:title => Matches.exact("ScreenFlow"))
  window.find.first_item_matching(:identifier => Matches.exact("_NS:14")).press
end
