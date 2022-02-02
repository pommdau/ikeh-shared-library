//
//  NSControl+Extensions.swift
//  QuickImageUploader
//
//  Created by HIROKI IKEUCHI on 2022/02/02.
//

import Cocoa

extension NSControl.StateValue {
    var isOn: Bool {
        return self == .on
    }
}
