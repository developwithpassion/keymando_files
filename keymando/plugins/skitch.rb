class Skitch < Plugin
  requires_version '1.1.4'
end

def screen_shot(title, match_exact = true)
  command "Skitch #{title}" do
    app = Accessibility::Gateway.get_application_by_name "skitch"
    capture_menu = app.menu_bar.find.first_item_matching(:role => Matches.partial("menubaritem"), :title => Matches.exact("Capture")).find
    title_matcher = match_exact ? Matches.exact(title) : Matches.partial(title)
    menu_item = capture_menu.first_item_matching(:role => Matches.partial("menuitem"),:title => title_matcher)
    menu_item.press
  end
end

screen_shot "Fullscreen Snapshot"
screen_shot "Crosshair Snapshot"
screen_shot "Window Snapshot", false

