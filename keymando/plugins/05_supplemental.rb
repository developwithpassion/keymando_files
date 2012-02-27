private_folder = "#{ENV['HOME']}/repositories/developwithpassion/keymando_private_plugins/*.rb"
Dir.glob(File.join(private_folder,"**/*.rb")).each{|file| load(File.expand_path(file))} if Dir.exist?(private_folder)

