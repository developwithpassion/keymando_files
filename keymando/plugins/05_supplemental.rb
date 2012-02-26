supplemental_folder = "#{ENV['HOME']}/repositories/developwithpassion/devtools/mac/keymando"
Dir.glob(File.join(supplemental_folder,"**/*.rb")).each{|file| load(File.expand_path(file))} if Dir.exist?(supplemental_folder)

