//
//  Bundle+appDisplayName.swift
//  Peelable Sticky
//
//  Created by HIROKI IKEUCHI on 2023/12/22.
//

import Foundation

extension Bundle {
    var appDisplayName: String {
        if let displayName = object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return displayName
        } else if let bundleName = object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }
        return "(App Name)"
    }
}
