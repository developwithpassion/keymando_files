class NeatReceipts < Plugin
  requires_version '1.1.4'
end

def neat(&block)
  app = Accessibility::Gateway.get_application_by_name "Neat"
  app.front_most = true
  app.instance_eval &block
end


command "Neat Receipts Edit Item" do
  neat do
    edit = focused_window.find.first_item_matching(:role => Matches.partial("button"), :title => Matches.exact("Editor"))
    edit.press
    date_field = focused_window.find.first_item_matching(:role => Matches.partial("textfield"))
    date_field.focused = true
  end
end

command "Neat Receipts Item Save" do
  neat do
    save_button = main_window.find.first_item_matching(:role => Matches.partial("button"), :help => Matches.exact("Save and Close"))
    save_button.press
  end
end

command "Neat Receipts Combine Selected Items" do
  neat do
    combine_menu_item = menu_bar.find.first_item_matching(:role => Matches.partial("menuitem"), :title => Matches.exact("Combine Selected Items"))
    combine_menu_item.press
  end
end
