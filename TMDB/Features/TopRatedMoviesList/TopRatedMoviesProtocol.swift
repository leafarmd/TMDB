//
//  TopRatedMoviesProtocol.swift
//  TMDB
//
//  Created by Rafael Damasceno on 15/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import Foundation

import UIKit

protocol TopRatedMoviesView: class {
    func setNavigationTitle(_ text: String)
    func startLoadingFeedback()
    func stopLoadingFeedback()
    func presenterError(message: String)
    func reloadData(with model: [TopMovieOutput])
}

protocol TopRatedMoviesServiceInput: class {
    var output: TopRatedMoviesServiceOutput? { get set }
    func fetchTopRatedMovies(page number: Int)
}

protocol TopRatedMoviesServiceOutput: class {
    func fetchTopRatedMoviesSucceeded(output: TopRatedMoviesOutput)
    func fetchTopRatedMoviesFailed(message: String)
}

protocol TopRatedMoviesRoutering: class {
    func makeViewController() -> UIViewController
}
