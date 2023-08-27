//
//  CustomAlert.swift
//  Vocapic
//
//  Created by ericzero on 8/27/23.
//

import Foundation
import UIKit

class CustomAlert: UIView {
    
    let doneBtn = UIButton()
    var part = UIButton()
    private var selectedLanguage = "English - Russian"
    //let translation = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        clipsToBounds = true
        layer.cornerRadius = 12
        
        doneBtn.setTitle("Save", for: .normal)
        doneBtn.setTitleColor(.white, for: .normal)
        doneBtn.backgroundColor = UIColor.systemPink
        doneBtn.addTarget(self, action: #selector(doneBtnTapped), for: .touchUpInside)
        addSubview(doneBtn)
        
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                doneBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        doneBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        doneBtn.bottomAnchor.constraint(equalTo: bottomAnchor),
        doneBtn.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        part.setTitle("ENGLISH - RUSSIAN", for: .normal)
        part.setTitleColor(UIColor.white, for: .normal)
        part.backgroundColor = UIColor.systemPink
        part.addTarget(self, action: #selector(partTapped), for: .touchUpInside)
        
        part.layer.cornerRadius = 12
        part.clipsToBounds = true
        
        addSubview(part)
        //addSubview(translation)
        
        part.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            part.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            part.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            part.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    @objc func partTapped(){
        //selectedLanguage = selectedLanguage == "ENGLISH" ? "RUSSIAN" : "ENGLISH"
        if selectedLanguage == selectedLanguage {
           part.setTitle("English - Russian", for: .normal)
       } else {
           part.setTitle("Russian - English", for: .normal)
       }
            // Update the title of the button.
        part.setTitle(selectedLanguage, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doneBtnTapped(){
        removeFromSuperview()
        
    }
    
}
