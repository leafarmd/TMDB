import Foundation

struct APIErrorModel: Decodable {
    let message: String?
    let code: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "status_message"
        case code = "status_code"
    }
}
