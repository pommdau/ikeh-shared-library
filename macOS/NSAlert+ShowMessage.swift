//
//  NSAlert+ShowMessage.swift
//  QuickImageUploader
//
//  Created by HIROKI IKEUCHI on 2022/01/27.
//

import Cocoa

extension NSAlert {
    static func showMessage(messageText: String, informativeText: String = "", alertStyle: NSAlert.Style = .informational) {
        let alert = NSAlert()
        alert.alertStyle = alertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.addButton(withTitle: "OK")
        alert.buttons.first?.keyEquivalent = "\r"
        alert.runModal()
    }
}
