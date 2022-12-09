import Foundation

final class KeysDecoder {
    static func decode() -> Keys? {
        guard let keysURL = Bundle.module.url(forResource: "Keys", withExtension: "plist"),
              let data = try? Data(contentsOf: keysURL),
              let keys = try? PropertyListDecoder().decode(Keys.self, from: data) else { return nil }
        return keys
    }
}
