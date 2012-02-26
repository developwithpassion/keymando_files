module AccessibilityUtility
  class DisplayItem
    attr_accessor :original
    def initialize(original,display)
      @original = original
      @display = display
    end

    def to_s
      return @display
    end

    def method_missing(name,*args,&block)
      @original.send(name,args,block)
    end
  end
end

module Accessibility
  class Element
    include AccessibilityUtility
    def all_menu_items
      menus = self.menu_bar.find.all_items_matching(:role => Matches.partial("menuitem")).map{|item| DisplayItem.new(item,(item.title == nil ? "" : item.title))}.select{|item| item.to_s != ""}

      return menus || []
    end

    def center
      point = CGPoint.new
      point.x = self.position.x + (self.size.width / 2)
      point.y = self.position.y + (self.size.height / 2)
      return point
    end

    def click_center
      MouseMacros.move_mouse(self.center.x,self.center.y)
      MouseMacros.left_click
    end
  end
end
