//
//  NSView+backgroundColor.swift
//  ZoomImageViewDemo
//
//  Created by HIROKI IKEUCHI on 2022/02/15.
//

import Cocoa

extension NSView {

    @IBInspectable var backgroundColor: NSColor? {
        get {
            guard let layer = layer, let backgroundColor = layer.backgroundColor else {return nil}
            return NSColor(cgColor: backgroundColor)
        }
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }

}
