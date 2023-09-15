//
//  DetailCollectionViewCell.swift
//  Vocapic
//
//  Created by ericzero on 8/9/23.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var detailBackground: UIView!
    
    @IBOutlet var detailImageView: UIImageView!
    
    @IBOutlet var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.white
        detailBackground.layer.shadowColor = UIColor.black.cgColor
        detailBackground.layer.shadowOpacity = 1
        detailBackground.layer.shadowOffset = .zero
        detailBackground.layer.shadowRadius = 10
        //detailBackground.layer.borderColor = UIColor.black.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.detailImageView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.opacity = 0.3
        self.detailImageView.layer.addSublayer(gradientLayer)
        
    }
    
    func updateDetailPage(data: SubcategoryDetail) {
        detailLabel.text = data.subcategory

        if let detailImage = data.subcategoryImage {
            detailImageView.image = UIImage(named: detailImage)
        }
    }

}
