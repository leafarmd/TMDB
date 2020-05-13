//
//  TopRatedMovieDetailPresenter.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import Foundation

class TopRatedMovieDetailPresenter {
    let id: Int
    let interactor: TopRatedMovieDetailServiceInput = TopRatedMovieDetailInteractor()
    
    weak var view: TopRatedMovieDetailView?
    
    init(id: Int) {
        self.id = id
    }
    
    
    func attachView(view: TopRatedMovieDetailView) {
        self.view = view
        view.startLoadingFeedback()
        interactor.output = self
        interactor.fetchMovieDetail(id: id)
    }
    
}

extension TopRatedMovieDetailPresenter: TopRatedMovieDetailServiceOutput {
    func fetchMovieCastSucceeded(output: creditsOutput) {
        view?.setCast(output.cast)
    }
    
    func fetchMovieCastFailed(message: String) {
        view?.presenterError(message)
    }
    
    
    func fetchTopRatedMovieDetailSucceeded(output: MovieDetailOutput) {
        view?.stopLoadingFeedback()
        view?.showItems()
        view?.setTitle(output.title)
        view?.setPoster(output.posterPath ?? "")
        view?.setBackdrop(output.backdropPath ?? "")
        view?.setRating("\(output.voteAverage)")
        view?.setOverview(output.overview ?? "")
        if let duration = output.runtime {
            view?.setDuration("Duração \(duration.minToTime())")
        } else {
          view?.setDuration("")
        }
        interactor.fetchMovieCast(id: self.id)
        guard let id = output.belongsToCollection?.id else { return }
        interactor.fetchMovieImageColletion(collection: id)
        
    }
    
    func fetchTopRatedMovieDetailFailed(message: String) {
        view?.stopLoadingFeedback()
        view?.presenterError(message)
    }
    
    func fetchMovieImageColletionSucceeded(output: CollectionOutput) {
        //TODO: add collection
    }
    
    func fetchMovieImageColletionFailed(message: String) {
        //TODO: add collection error
    }
}
