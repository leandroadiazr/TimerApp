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
        NSLayoutConstraint.activate([
            appTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            appTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            appTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            appTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            counterContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterContainer.topAnchor.constraint(equalTo: appTitle.bottomAnchor, constant: 50),
            counterContainer.widthAnchor.constraint(equalToConstant: 300),
            counterContainer.heightAnchor.constraint(equalToConstant: 280)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: counterContainer.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: counterContainer.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            hourLabel.widthAnchor.constraint(equalToConstant: 71),
            hourLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            minuteLabel.widthAnchor.constraint(equalToConstant: 71),
            minuteLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            secondsLabel.widthAnchor.constraint(equalToConstant: 71),
            secondsLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            startTimerBtn.topAnchor.constraint(equalTo: counterContainer.bottomAnchor, constant: 50),
            startTimerBtn.widthAnchor.constraint(equalToConstant: 100),
            startTimerBtn.heightAnchor.constraint(equalToConstant: 40),
            startTimerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
        ])
        NSLayoutConstraint.activate([
            stopTimerBtn.topAnchor.constraint(equalTo: counterContainer.bottomAnchor, constant: 50),
            stopTimerBtn.widthAnchor.constraint(equalToConstant: 100),
            stopTimerBtn.heightAnchor.constraint(equalToConstant: 40),
            stopTimerBtn.leadingAnchor.constraint(equalTo: startTimerBtn.trailingAnchor, constant: 10),
            
        ])
        
        NSLayoutConstraint.activate([
            resetTimerBtn.topAnchor.constraint(equalTo: counterContainer.bottomAnchor, constant: 50),
            resetTimerBtn.widthAnchor.constraint(equalToConstant: 100),
            resetTimerBtn.heightAnchor.constraint(equalToConstant: 40),
            resetTimerBtn.leadingAnchor.constraint(equalTo: stopTimerBtn.trailingAnchor, constant: 10),
            
        ])
        timePicker.frame = CGRect(x: 20, y: 630, width:  view.bounds.width * 0.90, height: 200)
        
        
    }
    
    
}
