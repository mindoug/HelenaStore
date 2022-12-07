//
//  CategoryCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/1/22.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    let categories = ["Summer Style", "T-Shirt", "Dress", "Accessories", "Shoes", "Swimwear"]
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dotLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func displayCategory() {
        
    }
    
    
}
