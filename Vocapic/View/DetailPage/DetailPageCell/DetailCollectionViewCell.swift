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
    
    @IBOutlet var detailArrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func detailData(data: DetailInfo) {
//        detailImageView.image = data.detailImage
//        detailLabel.text = data.detailLabel
//    }

}
