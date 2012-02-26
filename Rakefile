task :default => :link

task :link do
  ["keymandorc.rb","keymando"].each do|file|
    system("ln -s #{File.expand_path(file)} ~/.#{file}")
  end
end
