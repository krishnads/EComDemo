//
//  ProductCell.swift
//  EComDemo
//
//  Created by Krishna on 20/05/20.
//  Copyright © 2020 Krishna. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var stackViewColors: UIStackView!
    @IBOutlet weak var stackViewSizes: UIStackView!
    
    override func awakeFromNib() {
        contentView.layer.cornerRadius = 0.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true
    }

    
}
