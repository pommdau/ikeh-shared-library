//
//  PreferencesWindow.swift
//  QuickImageUploader
//
//  Created by HIROKI IKEUCHI on 2022/01/25.
//

import Cocoa

class PreferencesWindow: NSPanel {
    
    // MARK: - Overrides
    
    override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        switch menuItem.action {
        case #selector(toggleToolbarShown(_:))?:
            return false
        default:
            return super.validateMenuItem(menuItem)
        }
    }
    
    override func keyDown(with event: NSEvent) {
        if event.modifierFlags.intersection(.deviceIndependentFlagsMask).contains(.command) {
            if event.keyCode == 13 {  // command + w
                self.close()
                return
            }
        }
        super.keyDown(with: event)
    }
    
}
