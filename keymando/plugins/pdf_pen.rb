class PDFPen < Plugin
  requires_version '1.1.7'
end
  
command "PDFPen Draw Rectangle" do
  app = Accessibility::Gateway.get_application_by_name "PDFPen"
  app.menu_bar.find.first_item_matching(:role => Matches.partial("menuitem"),:title => Matches.exact("Rectangle")).press
end
