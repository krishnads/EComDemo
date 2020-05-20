//
//  CategoryTableCell.swift
//  EComDemo
//
//  Created by Krishna on 20/05/20.
//  Copyright © 2020 Krishna. All rights reserved.
//

import UIKit

class CategoryTableCell: UITableViewCell {
    
    @IBOutlet weak var collectionViewProducts: UICollectionView!

    var arrayProducts: [CategoryProduct]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWith(_ products: [CategoryProduct]) {
        arrayProducts = products
        self.collectionViewProducts.delegate = self
        self.collectionViewProducts.dataSource = self
        self.collectionViewProducts.reloadData()
    }

}

extension CategoryTableCell:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayProducts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        return cell
    }
    
    
}
