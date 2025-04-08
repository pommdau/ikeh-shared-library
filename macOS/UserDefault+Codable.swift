import Foundation

extension UserDefaults {
    
    func codableItem<T>(forKey defaultName: String) -> T? where T: Codable {
        let jsonDecoder = JSONDecoder()
        guard let itemData = self.data(forKey: defaultName),
              let item = try? jsonDecoder.decode(T.self, from: itemData) else {
            return nil
        }
        
        return item
    }
    
    func setCodableItem<T>(_ value: T, forKey defaultName: String) where T: Codable {
        let jsonEncoder = JSONEncoder()
        guard let valueData = try? jsonEncoder.encode(value) else {
            return
        }
        self.set(valueData, forKey: defaultName)
    }
}
