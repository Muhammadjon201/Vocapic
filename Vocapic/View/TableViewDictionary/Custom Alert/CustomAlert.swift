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
    var part2 = UIButton()
    var titleLbl = UILabel()
    var currentLanguage = "English -> Russian"
    //let translation = UILabel()
    
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
        
        part.setTitle(currentLanguage, for: .normal)
        part.titleLabel?.font = UIFont(name: "Satoshi-Bold", size: 12)
        part.titleLabel?.textAlignment = .center
        part.contentHorizontalAlignment = .center
        part.setTitleColor(UIColor.white, for: .normal)
        part.backgroundColor = UIColor.systemPink
        part.addTarget(self, action: #selector(partTapped), for: .touchUpInside)
        
        part.layer.cornerRadius = 6
        part.clipsToBounds = true
        
        addSubview(part)
        //addSubview(translation)
        
        part.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            part.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 40),
            part.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            part.heightAnchor.constraint(equalToConstant: 30),
            part.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        part2.setTitle("Russian -> English", for: .normal)
        part2.titleLabel?.font = UIFont(name: "Satoshi-Bold", size: 12)
        part2.setTitleColor(UIColor.white, for: .normal)
        part2.backgroundColor = UIColor.systemPink
        part2.titleLabel?.textAlignment = .center

        part2.addTarget(self, action: #selector(partTapped), for: .touchUpInside)
        
        part2.layer.cornerRadius = 6
        part2.clipsToBounds = true
        
        addSubview(part2)
        //addSubview(translation)
        
        part2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            part2.topAnchor.constraint(equalTo: part.bottomAnchor, constant: 20),
            part2.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            part2.heightAnchor.constraint(equalToConstant: 30),
            part2.widthAnchor.constraint(equalToConstant: 120)

        ])
        
    }
    
    @objc func partTapped(){
        currentLanguage = currentLanguage == "English - Russian" ? "Russian - English" : "English - Russian"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doneBtnTapped(){
        removeFromSuperview()
        
    }
    
}
