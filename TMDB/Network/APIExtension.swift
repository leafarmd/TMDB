import Foundation
import UIKit

extension API {
    
    enum Language: String {
        case enUS, ptBR
        
        var type: String {
            switch  self {
            case .enUS:
                return "en-US"
            case .ptBR:
                return "pt-BR"
            }
        }
    }
    
    enum Result<Success, Failure, APIError> where Failure : Error {
        case success(Success)
        case failure(Failure)
        case APIError(APIError)
    }
    
    enum RequestError: Error {
        case malformedURL
        case requestFailed
        case invalidData
        case decodingFailed
        
        var message: String {
            switch self {
                case .malformedURL:
                    return "error with URL requested"
                case .requestFailed:
                    return "error with request"
                case .invalidData:
                    return "invalid data"
                case .decodingFailed:
                    return "data decode failed"
            }
        }
    }
    
    enum HttpMethod: String {
        case POST
        case GET
    }
    
    typealias RequestResult<T> = Result<T, RequestError, APIErrorModel>
    typealias RequestImageResult = (Result<UIImage, RequestError, APIErrorModel>) -> Void
    typealias CompletionCallback<T: Decodable> = (RequestResult<T>) -> Void
}
