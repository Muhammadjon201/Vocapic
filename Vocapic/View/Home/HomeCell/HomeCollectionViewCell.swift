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
        contentView.backgroundColor = UIColor.white
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.homeBackgroundImage.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.opacity = 0.8
        self.homeBackgroundImage.layer.addSublayer(gradientLayer)
        
    }
    
    func updateCell(data: CategoryDetail) {
        categoryLabel.text = data.category
        
        if let categoryImage = data.categoryImage {
            homeBackgroundImage.image = UIImage(named: categoryImage)
        }
    }
}
