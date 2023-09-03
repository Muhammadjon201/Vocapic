//
//  RateAppView.swift
//  Vocapic
//
//  Created by ericzero on 9/1/23.
//

import UIKit
import Lottie

//class RateAppView: UIView {
//    
//    private let rateView: LottieAnimationView = {
//        let rateView = LottieAnimationView(name: "rateAnimation")
//        rateView.loopMode = .loop
//        
//        rateView.translatesAutoresizingMaskIntoConstraints = false
//        return rateView
//    }()
//        
//    let doneBtn = UIButton()
//
//    var titleLbl = UILabel()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        backgroundColor = .white
//        clipsToBounds = true
//        layer.cornerRadius = 12
//        layer.borderWidth = 2
//        layer.borderColor = UIColor.systemPink.cgColor
//        
//        NSLayoutConstraint.activate([
//            //rateView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            rateView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            rateView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            rateView.widthAnchor.constraint(equalToConstant: 100),
//            rateView.heightAnchor.constraint(equalToConstant: 100)
//            
//        ])
//        addSubview(rateView)
//        rateView.play()
//        
//        titleLbl.text = "Your Feedback is Valuable! \n Would you like to review on AppStore?"
//        titleLbl.font = UIFont(name: "Satoshi-Bold", size: 17)
//        titleLbl.textColor = UIColor.black
//        addSubview(titleLbl)
//        
//        titleLbl.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            titleLbl.topAnchor.constraint(equalTo: rateView.bottomAnchor, constant: 30),
//            titleLbl.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
//        ])
//        
//        doneBtn.setTitle("Rate Now", for: .normal)
//        doneBtn.setTitleColor(.white, for: .normal)
//        doneBtn.backgroundColor = UIColor.black
//        doneBtn.titleLabel?.font = UIFont(name: "Satoshi-Bold", size: 17)
//        doneBtn.addTarget(self, action: #selector(doneBtnTapped), for: .touchUpInside)
//        addSubview(doneBtn)
//        
//        doneBtn.translatesAutoresizingMaskIntoConstraints = false
//               NSLayoutConstraint.activate([
//        doneBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//        doneBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//        doneBtn.bottomAnchor.constraint(equalTo: bottomAnchor),
//        doneBtn.heightAnchor.constraint(equalToConstant: 50)
//        ])
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc func doneBtnTapped(){
//        removeFromSuperview()
//    }
//    
//}
