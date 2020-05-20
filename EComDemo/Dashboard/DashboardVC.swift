//
//  DashboardVC.swift
//  EComDemo
//
//  Created by Krishna on 20/05/20.
//  Copyright © 2020 Krishna. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView {
        let ai = UIActivityIndicatorView()
        ai.style = .whiteLarge
        ai.color = .darkGray
        ai.hidesWhenStopped = true
        ai.startAnimating()

        return ai
    }
    
    let viewModel = DashboardVieModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromAPI()
    }
    
    func getDataFromAPI() {
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        viewModel.getProducts { [unowned self] in
            self.activityIndicator.stopAnimating()
        }
    }


}

