//
//  HomeCollectionViewCell.swift
//  Vocapic
//
//  Created by ericzero on 7/30/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(data: String) {
        categoryLabel.text = data
    }
}
