//
//  TopRatedMoviesPresenter.swift
//  TMDB
//
//  Created by Rafael Damasceno on 15/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

final class TopRatedMoviesPresenter {
    
    // MARK: Properties
    private weak var view: TopRatedMoviesView?
    private var actualPage: Int = 1
    private var totalPages: Int = 1
    private var totalRows: Int = 1
    private let interactor = TopRatedMoviesInteractor()
    private var results: [TopMovieOutput] = []
    
    // MARK: Internal functions
    
    init() {
        view?.startLoadingFeedback()
        interactor.output = self
    }
    
    func attachView(view: TopRatedMoviesView) {
        self.view = view
        interactor.fetchTopRatedMovies(page: actualPage)
        view.setNavigationTitle("Top Rated Movies")
    }
    
    func setActualRow(_ row: Int) {
        if row == totalRows - 1 && actualPage < totalPages {
            actualPage += 1
            interactor.fetchTopRatedMovies(page: actualPage)
        }
    }
}

// MARK: - TopRatedMoviesServiceOutput

extension TopRatedMoviesPresenter: TopRatedMoviesServiceOutput {
    func fetchTopRatedMoviesSucceeded(output: TopRatedMoviesOutput) {
        view?.stopLoadingFeedback()
        guard let movies = output.results else { return }
        results.append(contentsOf: movies)
        guard let value = output.results?.count, let totalPages = output.totalPages else { return }
        totalRows = value
        self.totalPages = totalPages
        view?.reloadData(with: results)
    }
    
    func fetchTopRatedMoviesFailed(message: String) {
        view?.stopLoadingFeedback()
        view?.presenterError(message: message)
    }
}
