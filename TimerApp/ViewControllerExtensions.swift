//
//  ViewControllerExtensions.swift
//  TimerApp
//
//  Created by Leandro Diaz on 8/28/20.
//  Copyright © 2020 Leandro Diaz. All rights reserved.
//

import UIKit

extension ViewController {
    
    func showAlert() {
        let ac = UIAlertController(title: "Timer App", message: "Time has ended....", preferredStyle: .alert)
        ac.view.layer.borderWidth = 1
        ac.view.layer.cornerRadius = 5
        ac.view.layer.borderColor = UIColor.white.cgColor
        
        let done = UIAlertAction(title: "OK", style: .cancel)
        ac.addAction(done)
        present(ac, animated: true)
    }
    
    
    
    
    func setupConstraints() {
        let screenSize = UIScreen.main.bounds
        let screenWidth: CGFloat = screenSize.width
        
        NSLayoutConstraint.activate([
            appTitle.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6.5),
            appTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            appTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            appTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            counterContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterContainer.topAnchor.constraint(equalToSystemSpacingBelow: appTitle.bottomAnchor, multiplier: 6.5),
            counterContainer.widthAnchor.constraint(equalToConstant: screenWidth * 0.75),
            counterContainer.heightAnchor.constraint(equalToConstant: 280)
        ])
        
        NSLayoutConstraint.activate([
            timerStackView.centerXAnchor.constraint(equalTo: counterContainer.centerXAnchor),
            timerStackView.centerYAnchor.constraint(equalTo: counterContainer.centerYAnchor),
            timerStackView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.70)
        ])
        
        
        NSLayoutConstraint.activate([
            hIndicator.widthAnchor.constraint(equalToConstant: 20),
            hIndicator.heightAnchor.constraint(equalToConstant: 40),
            
            mIndicator.widthAnchor.constraint(equalToConstant: 20),
            mIndicator.heightAnchor.constraint(equalToConstant: 40),
            
            sIndicator.widthAnchor.constraint(equalToConstant: 20),
            sIndicator.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            hourLabel.widthAnchor.constraint(equalTo: timerStackView.widthAnchor, multiplier: 0.25),
            hourLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            minuteLabel.widthAnchor.constraint(equalTo: timerStackView.widthAnchor, multiplier: 0.25),
            minuteLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            secondsLabel.widthAnchor.constraint(equalTo: timerStackView.widthAnchor, multiplier: 0.25),
            secondsLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            btnStackView.topAnchor.constraint(equalToSystemSpacingBelow: counterContainer.bottomAnchor, multiplier: 6.5),
            btnStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnStackView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.60)
        ])
        
        NSLayoutConstraint.activate([
            startTimerBtn.widthAnchor.constraint(equalTo: btnStackView.widthAnchor, multiplier: 0.30),
            startTimerBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            stopTimerBtn.widthAnchor.constraint(equalTo: btnStackView.widthAnchor, multiplier: 0.30),
            stopTimerBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            resetTimerBtn.widthAnchor.constraint(equalTo: btnStackView.widthAnchor, multiplier: 0.30),
            resetTimerBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        timePicker.frame = CGRect(x: view.frame.width * 0.05, y: view.frame.height / 1.5, width:  view.bounds.width * 0.90, height: 200)
    }
}
