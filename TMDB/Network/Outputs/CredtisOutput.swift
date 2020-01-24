//
//  CredtisOutput.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

struct creditsOutput: Codable {

    let id: Int
    let cast: [Cast]
}

struct Cast: Codable {

    let character: String
    let name: String
    let order: Int
    let profilePath: String?

    private enum CodingKeys: String, CodingKey {
        case character = "character"
        case name = "name"
        case order = "order"
        case profilePath = "profile_path"
    }

}
