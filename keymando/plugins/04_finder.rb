class FinderPlugin < Plugin
  requires_version '1.1.4'
end

class Finder
  def self.find(path,args = {})
    extension = args.fetch(:extension,'.app')
    depth = args.fetch(:max_depth,2)

    items = `find #{path} -type d -iname '*#{extension}' -maxdepth #{depth}`.chomp.split("\n").map{|item| DisplayItem.new(item,File.basename(item).gsub(extension,""))}
    items.each{|item| yield item if block_given?}
    items
  end
end
