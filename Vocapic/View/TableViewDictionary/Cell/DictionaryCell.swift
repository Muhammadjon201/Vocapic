//
//  DictionaryCell.swift
//  Vocapic
//
//  Created by ericzero on 8/13/23.
//

import UIKit

class DictionaryCell: UITableViewCell {
    
    weak var dictionaryViewController: DictionaryViewController?
    weak var convertTap: CustomAlert?
    
    var isEnglishToRussian = false
    
    var labelTapAction: (() -> Void)?
        
    @IBOutlet var backgroundSplashView: UIView! {
        didSet {
            backgroundSplashView.backgroundColor = .white
            backgroundSplashView.layer.cornerRadius = 12
            //backgroundSplashView.layer.borderWidth = 0.4
            //backgroundSplashView.layer.borderColor = UIColor.systemGray2.cgColor
            
            backgroundSplashView.layer.shadowColor = UIColor.gray.cgColor
            backgroundSplashView.layer.shadowOpacity = 1
            backgroundSplashView.layer.shadowRadius = 5
            backgroundSplashView.layer.shadowOffset = CGSize(width: 0, height: 0)
            backgroundSplashView.layer.shadowPath = nil
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
        
        // Notify the view controller that the mic button was tapped
        micButtonTapAction?()
    }
        
    var micButtonTapAction: (() -> Void)?
    
    public func update(data: Vocabulary){
        if convertTap?.check ?? true { // Check the state of convertTap
                   firstLanguage.text = data.part
                   secondLanguage.text = data.translation
               } else {
                   firstLanguage.text = data.translation
                   secondLanguage.text = data.part
               }
    }
}
