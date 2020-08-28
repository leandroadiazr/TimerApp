//
//  CustomContainerView.swift
//  TimerApp
//
//  Created by Leandro Diaz on 8/28/20.
//  Copyright © 2020 Leandro Diaz. All rights reserved.
//

import UIKit

class CustomContainerView: UIView {

  override init(frame: CGRect) {
           super.init(frame: frame)
           configure()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor

    }
    
       
       private func configure(){
           layer.cornerRadius        = 75
           layer.borderColor         = UIColor.tertiarySystemBackground.cgColor
           layer.borderWidth         = 2
           layer.opacity             = 1
           clipsToBounds             = true
           translatesAutoresizingMaskIntoConstraints = false
       }

}
