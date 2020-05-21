//
//  DashboardVC.swift
//  EComDemo
//
//  Created by Krishna on 20/05/20.
//  Copyright © 2020 Krishna. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var tableViewProducts: UITableView!
    
    var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .large
        ai.color = .darkGray
        ai.hidesWhenStopped = true
        ai.startAnimating()
        return ai
    }()
    
    let viewModel = DashboardVieModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromAPI()
    }
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.rankings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.rankingAt(section)?.ranking ?? ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell") as! CategoryTableCell
        cell.setupCellWith(viewModel.productsFromRankingAt(indexPath.section))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    

}

extension DashboardVC {
    func getDataFromAPI() {
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        viewModel.getProducts { [unowned self] in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.tableViewProducts.reloadData()
            }
        }
    }
}

