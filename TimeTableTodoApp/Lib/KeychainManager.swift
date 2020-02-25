import Foundation
import KeychainAccess

struct KeychainManager {

    static let keychain = Keychain(service: "com.time_table_todo.app")

    enum Key: String {
        case token
        case userId
    }

    static var getToken: String? {
        return keychain[Key.token.rawValue]
    }

    static var getUserId: String? {
        return keychain[Key.userId.rawValue]
    }

    static func setToken(token: String) {
        keychain[Key.token.rawValue] = token
    }

    static func setUserId(userId: String) {
        keychain[Key.userId.rawValue] = userId
    }

    static func logout() {
        keychain[Key.token.rawValue] = nil
        keychain[Key.userId.rawValue] = nil
    }
}
