class FinderPlugin < Plugin
  requires_version '1.1.7'
end

class Finder
  def self.find(path,args = {})
    extension = args.fetch(:extension,'.app')
    depth = args.fetch(:max_depth,2)

    items = IO.popen("find #{path} -type d -iname '*#{extension}' -maxdepth #{depth}").lines.each do|app|
      the_app = app.chomp
      name = File.basename(the_app)
      yield DisplayItem.new(the_app,File.basename(the_app).gsub(extension,""))
    end
  end
end
