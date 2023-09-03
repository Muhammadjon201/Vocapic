//
//  DictionaryCell.swift
//  Vocapic
//
//  Created by ericzero on 8/13/23.
//

import UIKit

class DictionaryCell: UITableViewCell {
    
    var labelTapAction: (() -> Void)?
    
    @IBOutlet var backgroundSplashView: UIView! {
        didSet {
            backgroundSplashView.backgroundColor = .white
            backgroundSplashView.layer.cornerRadius = 12
            backgroundSplashView.layer.borderWidth = 0.4
            backgroundSplashView.layer.borderColor = UIColor.systemGray2.cgColor
        }
    }
    
    @IBOutlet var micChange: UIButton!
    
    @IBOutlet var gradientImg: UIImageView!
    
    
    @IBOutlet var firstLanguage: UILabel!
    
    @IBOutlet var secondLanguage: UILabel!
    
    @IBOutlet var lineLabel: UILabel!
    var check: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        firstLanguage.addGestureRecognizer(labelTapGesture)
        firstLanguage.isUserInteractionEnabled = true
        
        
    }
    
    @objc private func labelTapped() {
          labelTapAction?()
      }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func micButtonChange(_ sender: Any) {
        
//        check.toggle()
//
//        if check == true {
//            micChange.setImage(UIImage(systemName: "waveform.and.mic"), for: .normal)
//        } else {
//            micChange.setImage(UIImage(systemName: "mic"), for: .normal)
//        }
//
        // Notify the view controller that the mic button was tapped
        micButtonTapAction?()
    }
    
    var micButtonTapAction: (() -> Void)?
    
    func update(data: Vocabulary){
        firstLanguage.text = data.part
        secondLanguage.text = data.translation
    }
}
