class ApplicationLauncher
  class << self
    def register(path, options={})
      Finder.find(path,options) do|item|
        Command.define item.to_s,options do
          add_block do
            LaunchItem.new.run_using(item)
          end
        end unless Commands.exist?(item.to_s)
      end
    end
  end
end
