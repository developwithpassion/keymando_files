class AppLauncherPlugin < Plugin
  requires_version '1.1.7'
end

class ApplicationLauncher
  class << self
    def register(path, options={})
      Finder.find(path,options) do|item|
        command item.to_s,options do
          LaunchItem.new.run_using(item)
        end unless Commands.exist?(item.to_s)
      end
    end
  end
end
