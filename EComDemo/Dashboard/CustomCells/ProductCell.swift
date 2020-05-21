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
    
    func setupCellWith(_ product: CategoryProduct) {
        clearData()
        labelProductName.text = product.name ?? ""
        
        for variants in product.variants! {
            stackViewColors.addArrangedSubview(createColorButtonWith(color: variants.color ?? "red"))
            stackViewSizes.addArrangedSubview(createSizeButtonWith(number: variants.size ?? 0))
        }
    }
    
    func createColorButtonWith(color: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = getColorFromString(color)
        button.addConstraint(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25))
        button.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25))

        return button
    }
    
    func createSizeButtonWith(number: Int) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.setTitle("\(number)", for: .normal)
        button.addConstraint(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25))
        button.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25))

        return button
    }
    
    func getColorFromString(_ str: String) -> UIColor {
        if str.lowercased() == "black" {
            return .black
        } else if str.lowercased() == "blue" {
            return .systemBlue
        } else if str.lowercased() == "green" {
            return .systemGreen
        } else {
            return .systemRed
        }
    }
    
    
    func clearData() {
        for subview in stackViewColors.subviews {
            subview.removeFromSuperview()
        }
        for subview in stackViewSizes.subviews {
            subview.removeFromSuperview()
        }
    }

    
}
