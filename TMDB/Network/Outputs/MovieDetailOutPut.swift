//
//  MovieDetailOutPut.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import Foundation

struct MovieDetailOutput: Codable {

    let backdropPath: String?
    let id: Int
    let overview: String?
    let belongsToCollection: CollectionOutput?
    let posterPath: String?
    let runtime: Int?
    let title: String
    let voteAverage: Double

    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id = "id"
        case belongsToCollection = "belongs_to_collection"
        case overview = "overview"
        case posterPath = "poster_path"
        case runtime = "runtime"
        case title = "title"
        case voteAverage = "vote_average"
    }
}

struct CollectionOutput: Codable {
    let id: Int
    let parts: [PartsOutput]
}

struct PartsOutput: Codable {
    let backdropPath: String?
}
