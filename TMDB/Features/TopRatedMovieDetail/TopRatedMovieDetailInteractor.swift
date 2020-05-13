 //
//  TopRatedMovieDetailInteractor.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import Foundation

 class TopRatedMovieDetailInteractor: TopRatedMovieDetailServiceInput {
    func fetchMovieCast(id: Int) {
        API.request(from: .credits(id), type: creditsOutput.self) { [output] result in
            switch result {
            case .APIError(let error):
                output?.fetchMovieCastFailed(message: error.message ?? "unknow error")
            case .failure(let failure):
                output?.fetchMovieCastFailed(message: failure.message)
            case .success(let cast):
                output?.fetchMovieCastSucceeded(output: cast)
            }
        }
    }
    
    var output: TopRatedMovieDetailServiceOutput?
    
    func fetchMovieDetail(id: Int) {
        API.request(from: .movieDetail(id, language: .ptBR), type: MovieDetailOutput.self) { [output] result in
            switch result {
            case .APIError(let error):
                output?.fetchTopRatedMovieDetailFailed(message: error.message ?? "unknow error")
            case .failure(let failure):
                output?.fetchTopRatedMovieDetailFailed(message: failure.message)
            case .success(let detail):
                output?.fetchTopRatedMovieDetailSucceeded(output: detail)
            }
            
        }
    }
    
    func fetchMovieImageColletion(collection id: Int) {
        API.request(from: .images(id), type: CollectionOutput.self) { [output] result in
            switch result {
            case .APIError(let error):
                output?.fetchMovieImageColletionFailed(message: error.message ?? "unknow error")
            case .failure(let failure):
                output?.fetchMovieImageColletionFailed(message: failure.message)
            case .success(let collection):
                output?.fetchMovieImageColletionSucceeded(output: collection)
            }
            
        }
        
        
    }
}
