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

    var arrayProducts: [RankingProduct]?
    var arrayCategories: [Category]?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWith(_ products: [RankingProduct], categories: [Category]) {
        arrayProducts = products
        arrayCategories = categories
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
        
        if let product = arrayProducts?[indexPath.row] {
            if let p = getCatProductWith(id: product.id!) {
                cell.setupCellWith(p)
            }
        }
        
        return cell
    }
    
    
    func getCatProductWith(id: Int) -> CategoryProduct? {
        if let categories = arrayCategories {
            let products = categories.flatMap { (cat) in
                return cat.products!.map({ (p) in
                    return p
                })
            }.filter { (p) -> Bool in
                return p.id == id
            }
            
            if products.count > 0 {
                return products[0]
            }
        }
        
        return nil
    }
    
    
}
