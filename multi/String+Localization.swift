//
//  String+Localization.swift
//  Macarbon
//
//  Created by HIROKI IKEUCHI on 2022/03/24.
//
//  ref: CotEditor

import Foundation

extension String {
    
    /// Cocoa localized string
    /*
     (usage)
     alert.informativeText = "Do you want to install this theme?".localized
     
     (Localizable.strings)
     "Do you want to install this theme?" = "テーマをインストールしますか?";
     */
    var localized: String {
        
        return NSLocalizedString(self, comment: "")
    }
    
    
    /// returns a localized string, using the main bundle if one is not specified.
    func localized(tableName: String? = nil, bundle: Bundle = .main, value: String = "", comment: String = "") -> String {
        
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
    
}

