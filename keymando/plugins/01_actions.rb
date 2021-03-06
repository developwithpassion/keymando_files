class LaunchItem
  def run_using(item)
    NSTask.launchedTaskWithLaunchPath("/usr/bin/open",arguments:[item.original])
  end
end

class CallPhone
  def initialize(skype_app)
    @skype = skype_app
  end
  def run_using(item)
    searching_gateway = @skype.focused_window.find
    text_field = searching_gateway.first_item_matching(:role => Matches.partial("textfield"))
    text_field.Value = item.number
    searching_gateway.first_item_matching(:role => Matches.partial("button"),:title => Matches.exact("Call")).press
  end
end

