//
//  TopRatedMovieDetailProtocols.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

protocol TopRatedMovieDetailView: class {
    func setBackdrop(_ path: String)
    func setPoster(_ path: String)
    func setTitle(_ title: String)
    func setOverview(_ text: String)
    func setDuration(_ duration: String)
    func setRating(_ rating: String)
    func setImages(_ images: [String])
    func setCast(_ cast: [Cast])
    func startLoadingFeedback()
    func stopLoadingFeedback()
    func presenterError(_ message: String)
    func showItems()
}

protocol TopRatedMovieDetailServiceInput: class {
    var output: TopRatedMovieDetailServiceOutput? { get set }
    func fetchMovieDetail(id: Int)
    func fetchMovieImageColletion(collection id: Int)
    func fetchMovieCast(id: Int)
}

protocol TopRatedMovieDetailServiceOutput: class {
    func fetchTopRatedMovieDetailSucceeded(output: MovieDetailOutput)
    func fetchTopRatedMovieDetailFailed(message: String)
    func fetchMovieImageColletionSucceeded(output: CollectionOutput)
    func fetchMovieImageColletionFailed(message: String)
    func fetchMovieCastSucceeded(output: creditsOutput)
    func fetchMovieCastFailed(message: String)
    
}

protocol TopRatedMovieDetailRoutering: class {
    func makeViewController() -> UIViewController
}
