//
//  ViewController.swift
//  TimerApp
//
//  Created by Leandro Diaz on 8/28/20.
//  Copyright © 2020 Leandro Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let appTitle            = CustomLabel(backgroundColor: .clear, fontSize: 40, textColor: .systemBlue, textAlignment: .center, title: "Timer App")
    let counterContainer    = CustomContainerView(backgroundColor: .systemBlue)
    let timerStackView      = UIStackView()
    let btnStackView        = UIStackView()
    let hourLabel           = CustomLabel(backgroundColor: .clear, fontSize: 20, textColor: .white, textAlignment: .center, title: "")
    let minuteLabel         = CustomLabel(backgroundColor: .clear, fontSize: 20, textColor: .white, textAlignment: .center, title: "")
    let secondsLabel        = CustomLabel(backgroundColor: .clear, fontSize: 20, textColor: .white, textAlignment: .center, title: "")
    let hIndicator          = CustomLabel(backgroundColor: .clear, fontSize: 18, textColor: .systemBackground, textAlignment: .center, title: "H:")
    let mIndicator          = CustomLabel(backgroundColor: .clear, fontSize: 18, textColor: .systemBackground, textAlignment: .center, title: "M:")
    let sIndicator          = CustomLabel(backgroundColor: .clear, fontSize: 18, textColor: .systemBackground, textAlignment: .center, title: "S:")
    let timePicker          = UIPickerView()
    let startTimerBtn       = CustomButton(backgroundColor: .systemBlue, title: "Start")
    let stopTimerBtn        = CustomButton(backgroundColor: .systemBlue, title: "Stop")
    let resetTimerBtn       = CustomButton(backgroundColor: .systemBlue, title: "Reset")
    
    var timer: Timer!
    var secCounter = 0
    var hCounter = 0
    var minCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        appTitle.text = "Timer App"
        
        startButton()
        stopButton()
        resetButton()
        configureUI()
        configureStackView()
        configureTimePicker()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
        
    }
    
    func configureTimePicker(){
        view.addSubview(timePicker)
        
        timePicker.layer.cornerRadius = 5
        timePicker.delegate = self
        timePicker.dataSource = self
        
        setupConstraints()
    }
    
    @objc func callTimer() {
        timePicker.isHidden = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(_ sender: UIDatePicker) {
        var hourSet = hCounter
        var minSet = minCounter
        var secSet = secCounter
        
        
        if secSet > 0 {
            secSet -= 1
            secCounter = secSet
            secondsLabel.text = String(secSet)
        }
        
        if secSet == 0 && minSet > 0{
            minSet -= 1
            minCounter = minSet
            
            secSet = 59
            secCounter = secSet
            
            secondsLabel.text = String(secSet)
            minuteLabel.text = String(minSet)
        }
        
        if minSet == 0 && hourSet > 0 {
            hourSet -= 1
            hCounter = hourSet
            hourLabel.text = String(hourSet)
            
            minSet = 59
            minCounter = minSet
            minuteLabel.text = String(minSet)
            
            secSet = 59
            secCounter = secSet
            secondsLabel.text = String(secSet)
        }
        if hourSet == 0 && minSet == 0 && secSet == 0{
            print("hour: \(hourSet), min: \(minSet), sec: \(secSet)")
            showAlert()
            resetTimer()
        }
    }
    
    func startButton(){
        startTimerBtn.addTarget(self, action: #selector(callTimer), for: .touchUpInside)
    }
    
    func stopButton() {
        stopTimerBtn.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }
    
    func resetButton() {
        resetTimerBtn.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
    }
    
    @objc func stopTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            guard let running = self.timer else { return }
            running.invalidate()
        }
    }
    
    @objc func resetTimer() {
        timePicker.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            guard let running = self.timer else { return }
            running.invalidate()
        }
        hourLabel.text = "0"
        minuteLabel.text = "0"
        secondsLabel.text = "0"
        hCounter = 0
        minCounter = 0
        secCounter = 0
    }
    
    
    
    func configureStackView() {
        let hStack = [ timerStackView, btnStackView]
        for stack in hStack {
            stack.axis = .horizontal
            stack.distribution = .equalCentering
            stack.translatesAutoresizingMaskIntoConstraints = false
            
        }   
    }
    
    func configureUI() {
        view.addSubview(counterContainer)
        view.addSubview(appTitle)
        view.addSubview(timerStackView)
        view.addSubview(btnStackView)
        
        let indicators = [hIndicator, mIndicator, sIndicator]
        for indicator in indicators {
            indicator.layer.borderWidth = 0
        }
        
        timerStackView.addArrangedSubview(hIndicator)
        timerStackView.addArrangedSubview(hourLabel)
        timerStackView.addArrangedSubview(mIndicator)
        timerStackView.addArrangedSubview(minuteLabel)
        timerStackView.addArrangedSubview(sIndicator)
        timerStackView.addArrangedSubview(secondsLabel)
        
        
        btnStackView.addArrangedSubview(startTimerBtn)
        btnStackView.addArrangedSubview(stopTimerBtn)
        btnStackView.addArrangedSubview(resetTimerBtn)
        
        appTitle.layer.borderWidth = 0
        
        setupConstraints()
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%01d", row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let hour = row
            hCounter = hour
            hourLabel.text = String(hour)
        } else if component == 1 {
            let minutes = row
            minCounter = minutes
            minuteLabel.text = String(minutes)
        } else if component == 2{
            let seconds = row
            secCounter = seconds
            secondsLabel.text = String(seconds)
        }
    }
}
