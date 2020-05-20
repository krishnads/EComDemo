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

extension DashboardVC {

}

extension DashboardVC {
    func getDataFromAPI() {
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        viewModel.getProducts { [unowned self] in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
        }
    }
}

