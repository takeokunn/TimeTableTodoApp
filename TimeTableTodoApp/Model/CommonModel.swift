import Foundation
import Himotoki

struct CommonModel: Himotoki.Decodable {

    let message: String

    static func decode(_ e: Extractor) throws -> CommonModel {
        return try CommonModel(message: e <| ["message"])
    }
}
