import Foundation
import KeychainAccess

struct KeychainManager {

    static let keychain = Keychain(service: "com.time_table_todo.app")

    enum Key: String {
        case email
    }

    static var getEmail: String? {
        return keychain[Key.email.rawValue]
    }

    static func setEmail(email: String) {
        keychain[Key.email.rawValue] = email
    }

    static func logout() {
        keychain[Key.email.rawValue] = nil
    }
}
