class Underscore < Plugin
  class << self
    attr_accessor :enabled

    def toggle
      @enabled = ! @enabled
    end

    def enabled?
      lambda{Underscore.enabled == true}
    end
  end

  def after
    map ' ', '_', :if => Underscore.enabled?

    map "<Cmd-u>", lambda{ Underscore.toggle }
  end
end

