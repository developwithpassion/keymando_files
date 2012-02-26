def hit_a_hint
  Command.to_run :description => "Hit a hint" do
    add_block do
      app = Accessibility::Gateway.get_active_application
      window = app.windows.first

      #this is faster, the find method now can take an initial constraint which gets used by the depth first iterator
      #to constrain both what is yielded as well as pushed onto the stack for deeper traversal
      elements = window.find(ElementVisibleMatch.new(:window => window)).items_matching_all(ElementActionableMatch.new)
      # elements = window.find.items_matching_all(ElementVisibleMatch.new(:window => window),ElementActionableMatch.new)

      HintGenerator.reset

      # Decorate elements
      elements.map! do |element|
        # TextSummaryElement.new(TextActionsElement.new(HintElement.new(element)))
        HintLabelElement.new(HintElement.new(element))
      end
      
      dialog = DialogFactory.get('UiControls')
      dialog.window.center()
      dialog.draw_elements(elements)

      # NSApp.activateIgnoringOtherApps(true)
      NSRunningApplication.currentApplication.activateWithOptions(NSApplicationActivateIgnoringOtherApps)
      NSApp.runModalForWindow(dialog.window)
      NSApp.hide(dialog)
      NSApp.stopModal
    end
  end
end
