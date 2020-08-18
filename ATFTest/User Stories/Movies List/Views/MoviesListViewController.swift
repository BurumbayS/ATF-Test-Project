//
//  MoviesListViewController.swift
//  ATFTest
//
//  Created by Sanzhar Burumbay on 8/19/20.
//  Copyright © 2020 burumbays. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noResultsLabel: UILabel!
    @IBOutlet weak var connectionErrorLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    let viewModel = MoviesListViewModel()
    
    var moviesLoadCompletion: ((RequestStatus, String) -> () )?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configureViews()
        configureCollectionView()
        setCompletion()
        loadData()
    }
    
    private func configureViews() {
        tryAgainButton.layer.cornerRadius = 10
        tryAgainButton.layer.borderWidth = 1
        tryAgainButton.layer.borderColor = UIColor.blue.cgColor
        
        tryAgainButton.isHidden = true
        noResultsLabel.isHidden = true
        connectionErrorLabel.isHidden = true
    }
    
    private func updateList() {
        if (viewModel.moviesList.count == 0) {
            tryAgainButton.isHidden = true
            noResultsLabel.isHidden = false
            connectionErrorLabel.isHidden = true
        } else {
            tryAgainButton.isHidden = true
            noResultsLabel.isHidden = true
            connectionErrorLabel.isHidden = true
            collectionView.reloadData()
        }
    }
    
    private func noInternetConnection() {
        tryAgainButton.isHidden = false
        noResultsLabel.isHidden = true
        connectionErrorLabel.isHidden = false
    }
    
    private func setCompletion() {
        moviesLoadCompletion = { [weak self] (status, message) in
            switch status {
            case .success:
                self?.updateList()
            case .fail:
                print(message)
            case .error:
                self?.noInternetConnection()
            }
        }
    }
    
    private func loadData() {
        viewModel.loadMovies(completion: moviesLoadCompletion)
    }
    
    private func turnPage() {
        viewModel.turnPage(completion: moviesLoadCompletion)
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerNib(MovieItemCollectionViewCell.self)
    }

    @IBAction func tryAgainPressed(_ sender: Any) {
        loadData()
    }
}

extension MoviesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //calculate width with leading(30), trailing(30), and item space(20) paddings
        let width = (UIScreen.main.bounds.width - 80) / 2
        let height = width * 1.8
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieItemCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        cell.configure(withMovie: viewModel.moviesList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (indexPath.row == viewModel.moviesList.count - 1) {
            turnPage()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToMovieSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath else {
            return
        }
        
        if let destVC = segue.destination as? MovieDetailsViewController {
            destVC.viewModel = MovieDetailsViewModel(movie: viewModel.moviesList[indexPath.row])
        }
    }
}
