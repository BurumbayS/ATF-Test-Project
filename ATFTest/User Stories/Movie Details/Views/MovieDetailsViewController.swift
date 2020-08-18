//
//  MovieDetailsViewController.swift
//  ATFTest
//
//  Created by Sanzhar Burumbay on 8/19/20.
//  Copyright © 2020 burumbays. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerNib(MovieDetailsHeaderTableViewCell.self)
    }
    
}

extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieDetailsHeaderTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        cell.configure(withMovie: viewModel.movie)
        cell.selectionStyle = .none
        
        return cell
    }
    
}
