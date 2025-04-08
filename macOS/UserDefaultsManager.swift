//
//  UserDefaultsManager.swift
//  OpenPanelDemo
//
//  Created by HIROKI IKEUCHI on 2024/10/11.
//

import AppKit

struct UserDefaultsManager {

    // MARK: - Properties
        
    private static var library: URL? {
        FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first
    }
    
    private static var preferences: URL? {
        library?.appendingPathComponent("Preferences")
    }
    
    static var plist: URL? {
        guard let preferences,
              let bundleIdentifier = Bundle.main.bundleIdentifier else {
            return nil
        }
        return preferences.appendingPathComponent(bundleIdentifier).appendingPathExtension("plist")
    }
}

// MARK: - Functions

extension UserDefaultsManager {
    static func resetAll() {
        guard let appDomain = Bundle.main.bundleIdentifier else {
            return
        }
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
    
    static func showPlistInFinder() {
        guard let plist else {
            return
        }
        if FileManager.default.fileExists(atPath: plist.path) {
            NSWorkspace.shared.selectFile(plist.path, inFileViewerRootedAtPath: "")
        }
    }
    
    static func loadPlist() -> [String: Any] {
        guard
            let plist,
            let data = try? Data(contentsOf: plist),
            let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any]
        else {
            return [:]
        }
        return dict
    }
}
