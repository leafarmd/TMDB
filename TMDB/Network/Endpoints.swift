import Foundation

enum APIEndpoint {
    case topRated(language: API.Language, page: Int)
    case genre
    case credits(_ id: Int)
    case images(_ id: Int)
    case movieDetail(_ id: Int, language: API.Language)
}

extension APIEndpoint {
    
    var url: String {
        
        switch self {
        case .topRated:
            return "movie/top_rated"
        case .genre:
            return "genre/movie/list"
        case .movieDetail(let id, _):
            return "movie/\(id)"
        case .credits(let id):
            return "movie/\(id)/credits"
        case .images(let id):
            return "collection/\(id)"
        }
    }
    
    var params: [String: String] {
        
        switch self {
        case .topRated(let language, let page):
            return ["language": language.type, "page": "\(page)"]
        case .movieDetail(_ ,let language):
            return ["language": language.type]
        default:
            return [:]
        }
    }
    
    public enum ImageSize: String {
        case w45
        case w92
        case w154
        case w185
        case w300
        case w342
        case w500
        case h632
        case w780
        case w1280
        case original
    }
    
}
