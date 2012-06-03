command "Launch Application" do
  trigger_item_with(Commands.items.select{|item| item.respond_to?(:category) && item.category == :app}, RunACommand.new)
end

