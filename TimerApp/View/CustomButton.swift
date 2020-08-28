//
//  CustomButton.swift
//  TimerApp
//
//  Created by Leandro Diaz on 8/28/20.
//  Copyright © 2020 Leandro Diaz. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure(){
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.tertiaryLabel.cgColor
        setTitleColor(.white, for: .normal)
        titleLabel?.font         = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
