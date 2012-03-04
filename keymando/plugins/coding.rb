require 'ostruct'

KEYMANDO_SOURCE_ROOT = "/Users/jp/repositories/github/keymando"

def type_command(command)
  send_keys("#{command}<Enter>").run
end

def run_tmux_command(command)
  send_keys("<Ctrl-b>").run
  send_keys(":").run
  type_command("#{command}")
end

def rename_current_pane(new_name)
  run_tmux_command("rename-window #{new_name}")
end

def split_window(direction = nil)
  run_tmux_command("split-window #{"-#{direction}" unless direction == nil}")
end

def cd(directory)
  type_command("cd #{directory}")
end

Command.to_run :description => "Code - Keymando" do
  add_block do
    LaunchApp.new.run_using(OpenStruct.new(:original => "/Applications/Utilities/Terminal.app"))
    sleep(2)
    type_command("unset TMUX")
    type_command("tmux<Enter>")
    rename_current_pane("keymando")
    cd(KEYMANDO_SOURCE_ROOT)
    split_window("h")
    cd(File.join(KEYMANDO_SOURCE_ROOT,%w[keymando spec unit]))
    type_command("rspecs")
    split_window
    cd(File.join(KEYMANDO_SOURCE_ROOT,%w[keymando spec integration]))
    type_command("rspecs")
    run_tmux_command("select-pane -t 0")
    split_window
    cd(KEYMANDO_SOURCE_ROOT)
    type_command("mvim .")
    type_command("irb")
    run_tmux_command("select-pane -t 0")
  end
end
