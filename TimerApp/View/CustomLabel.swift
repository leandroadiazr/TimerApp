//
//  CustomLabel.swift
//  TimerApp
//
//  Created by Leandro Diaz on 8/28/20.
//  Copyright © 2020 Leandro Diaz. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, fontSize: CGFloat, textColor: UIColor, textAlignment: NSTextAlignment, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.text = title
        
    }
    
    private func configure(){
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        adjustsFontSizeToFitWidth    = true
        minimumScaleFactor = 0.90
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
