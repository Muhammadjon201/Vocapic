//
//  HomeCollectionViewCell.swift
//  Vocapic
//
//  Created by ericzero on 7/30/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var homeBackgroundImage: UIImageView!
    
    @IBOutlet var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(data: CategoryDetail) {
        categoryLabel.text = data.category
        
        if let categoryImage = data.categoryImage {
            homeBackgroundImage.image = UIImage(named: categoryImage)
        }
    }
}
