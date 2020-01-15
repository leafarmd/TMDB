import UIKit

protocol TopRatedMoviesView: class {
    func setNavigationTitle(_ text: String)
    func updateMoviesList()
    func startLoadingFeedback()
    func stopLoadingFeedback()
    func presenterError(message: String)
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

protocol TopRatedMoviesCellView: class {
    func setTitle(_ text: String)
    func setImage(_ image: UIImage)
    func setDate(_ text: String)
}

protocol MoviesDataSourceDelegate: class {
    func fetchNextPage(page: Int)
    func fetchTopRatedMoviesSucceeded()
    func fetchTopRatedMoviesFailed(message: String)
    func selectedMovie(movie: TopRatedMoviesOutput)
}
