//
//  DictionaryCell.swift
//  Vocapic
//
//  Created by ericzero on 8/13/23.
//

import UIKit

class DictionaryCell: UITableViewCell {

    @IBOutlet var firstLanguage: UILabel!
    
    @IBOutlet var secondLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(data: VocaPicModel){
        firstLanguage.text = data.word
        secondLanguage.text = data.translation
    }
   
}
