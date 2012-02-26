Command.to_run :description => "Terminal New Shell" do
  add_block do
    app = Accessibility::Gateway.get_application_by_name "terminal"
    app.menu_bar.find.first_item_matching(:role => Matches.partial("menuitem"),:title => Matches.exact("Basic 1")).press
  end
end
