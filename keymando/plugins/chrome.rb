class Chrome < Plugin
  requires_version '1.1.4'

  def chrome
    app = Accessibility::Gateway.get_active_application
    app.front_most = true
    app
  end

  def after
    only /Chrome/ do
      map ";jc" do
        javascript_console = chrome.menu_bar.find.first_item_matching({
            :role => Matches.partial("menuitem"),
            :title => Matches.partial("Javascript Console")
        })
        javascript_console.press
      end
    end
  end
end


