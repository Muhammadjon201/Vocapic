//
//  CustomAlert.swift
//  Vocapic
//
//  Created by ericzero on 8/27/23.
//

import Foundation
import UIKit

enum Language {
    case english
    case russian
}

class CustomAlert: UIView {

        
    let doneBtn = UIButton()
    let convertBtn = UIButton(type: .system)
    let partLbl = UILabel()
    let translation = UILabel()
    var titleLbl = UILabel()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 12
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemPink.cgColor
        
        doneBtn.setTitle("Save", for: .normal)
        doneBtn.setTitleColor(.white, for: .normal)
        doneBtn.backgroundColor = UIColor.black
        doneBtn.titleLabel?.font = UIFont(name: "Satoshi-Bold", size: 17)
        doneBtn.addTarget(self, action: #selector(doneBtnTapped), for: .touchUpInside)
        addSubview(doneBtn)
        
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                doneBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        doneBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        doneBtn.bottomAnchor.constraint(equalTo: bottomAnchor),
        doneBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        titleLbl.text = "Change Language"
        titleLbl.font = UIFont(name: "Satoshi-Bold", size: 17)
        titleLbl.textColor = UIColor.black
        addSubview(titleLbl)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLbl.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
       
        partLbl.text = "English"
        partLbl.font = UIFont(name: "Satoshi-Bold", size: 15)
        partLbl.textColor = UIColor.white
        partLbl.backgroundColor = UIColor.systemPink
        partLbl.textAlignment = .center
        partLbl.clipsToBounds = true
        partLbl.layer.cornerRadius = 12
        addSubview(partLbl)
        
        partLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            partLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 50),
            partLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            partLbl.heightAnchor.constraint(equalToConstant: 40),
            partLbl.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        translation.text = "Russian"
        translation.font = UIFont(name: "Satoshi-Bold", size: 15)
        translation.textColor = UIColor.white
        translation.backgroundColor = UIColor.systemPink
        translation.textAlignment = .center
        translation.clipsToBounds = true
        translation.layer.cornerRadius = 12
        addSubview(translation)
        
        translation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            translation.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 50),
            translation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            translation.heightAnchor.constraint(equalToConstant: 40),
            translation.widthAnchor.constraint(equalToConstant: 100)
        ])
       
        
        convertBtn.setImage(UIImage(named: "convertBtn"), for: .normal)
        convertBtn.tintColor = .white
        convertBtn.backgroundColor = UIColor.systemPink
        convertBtn.clipsToBounds = true
        convertBtn.layer.cornerRadius = 12
        convertBtn.addTarget(self, action: #selector(convertBtnTapped), for: .touchUpInside)
        addSubview(convertBtn)
        
        convertBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            convertBtn.centerYAnchor.constraint(equalTo: partLbl.centerYAnchor, constant: 0),
            convertBtn.leftAnchor.constraint(equalTo: partLbl.rightAnchor, constant: 15),
            convertBtn.rightAnchor.constraint(equalTo: translation.leftAnchor, constant: -15),
            convertBtn.heightAnchor.constraint(equalToConstant: 30),
        ])

        
    }
    
    var check: Bool = true
        
    @objc public func convertBtnTapped() {
        
        check.toggle()

        if check {
            partLbl.text = "English"
            translation.text = "Russian"
        } else {
            partLbl.text = "Russian"
            translation.text = "English"
        }

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doneBtnTapped(){
        removeFromSuperview()
    }
    
}
