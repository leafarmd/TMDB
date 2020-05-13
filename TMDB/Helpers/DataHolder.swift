import UIKit

final class TMDBHolder {
    
    static private(set) var shared = TMDBHolder()
    
    private init() {}
    
    //var genres: GenreModel?
    var cachedImgae: [String: UIImage] = [:]
    
}

extension TMDBHolder {
    
    static func invalidate() {
        shared = TMDBHolder()
    }
}
