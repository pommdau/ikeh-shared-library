//
//  File.swift
//  QuickImageUploader
//
//  Created by HIROKI IKEUCHI on 2022/02/03.
//

import Foundation

extension UserDefaults {
    
    // MARK: - Handle Encodable Object
    
    static func save<T: Encodable>(object: T, key: String) {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(object) else {
            return
        }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    static func load<T: Decodable>(key: String) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let data = UserDefaults.standard.data(forKey: key),
              let object = try? jsonDecoder.decode(T.self, from: data) else {
            return nil
        }
            
        return object
    }
}
