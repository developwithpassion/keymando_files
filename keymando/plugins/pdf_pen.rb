Command.to_run :description => "PDFPen Draw Rectangle" do
  add_block do
    app = Accessibility::Gateway.get_application_by_name "PDFPen"
    app.menu_bar.find.first_item_matching(:role => Matches.partial("menuitem"),:title => Matches.exact("Rectangle")).press
  end
end
