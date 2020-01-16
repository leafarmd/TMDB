//
//  TopRatedMoviesViewController.swift
//  TMDB
//
//  Created by Rafael Damasceno on 15/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

final class TopRatedMoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let presenter: TopRatedMoviesPresenter
    fileprivate var dataSource: [TopMovieOutput] = []
    
    
    init(presenter: TopRatedMoviesPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "TopRatedMoviesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) { return nil}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#042D2D")
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes =  [.foregroundColor: UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.attachView(view: self)
        tableView.dataSource = self
        tableView.register(TopRatedMoviesTableViewCell.nib, forCellReuseIdentifier: TopRatedMoviesTableViewCell.identifier)
    }
}

extension TopRatedMoviesViewController: TopRatedMoviesView {
    func setNavigationTitle(_ text: String) {
        title = text
    }
    
    func startLoadingFeedback() {
        Loading.start()
    }
    
    func stopLoadingFeedback() {
        Loading.stop()
    }
    
    func presenterError(message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func reloadData(with model: [TopMovieOutput]) {
        self.dataSource.removeAll()
        dataSource.append(contentsOf: model)
        tableView.reloadData()
    }
}

extension TopRatedMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopRatedMoviesTableViewCell.identifier) as! TopRatedMoviesTableViewCell
        
        cell.configure(data: dataSource[indexPath.row])
        presenter.setActualRow(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
