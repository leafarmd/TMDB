//
//  TopRatedMoviesInteractor.swift
//  TMDB
//
//  Created by Rafael Damasceno on 15/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import Foundation

final class TopRatedMoviesInteractor: TopRatedMoviesServiceInput {
    var output: TopRatedMoviesServiceOutput?
    
    func fetchTopRatedMovies(page number: Int) {
        API.request(from: .topRated(language: .ptBR, page: number), type: TopRatedMoviesOutput.self) { [output] result in
            switch result {
            case .APIError(let error):
                output?.fetchTopRatedMoviesFailed(message: error.message ?? "unknow error")
            case .failure(let failure):
                output?.fetchTopRatedMoviesFailed(message: failure.message)
            case .success(let success):
                output?.fetchTopRatedMoviesSucceeded(output: success)
            }
        }
    }
}
