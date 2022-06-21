//
//  ViewController.swift
//  egg_timer
//
//  Created by Faiaz Ibraev on 20/6/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var SliderButton: UISlider!
    @IBOutlet weak var softButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var soft:Int = 5
    var medium: Int = 10
    var hard: Int = 15
    var counterSoft:Int = 0
    var counterMed: Int = 0
    var counterHard: Int = 0
    var timer = Timer ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Please select egg type"
        timeLabel.text = ""
    }
    
    @IBAction func softEgg(_ sender: UIButton) {
        reset()
        softButton.isEnabled = false
        mediumButton.isEnabled = true
        hardButton.isEnabled = true
        nameLabel.text = "Soft"
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(stepBackSoft), userInfo: nil, repeats: true)
        }
        SliderButton.minimumValue = 0
        SliderButton.maximumValue = 5
    }
    
    @IBAction func mediumEgg(_ sender: UIButton) {
    reset()
        softButton.isEnabled = true
        mediumButton.isEnabled = false
        hardButton.isEnabled = true
        nameLabel.text = "Medium"
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(stepBackMedium), userInfo: nil, repeats: true)
    }
        SliderButton.minimumValue = 0
        SliderButton.maximumValue = 10
    }
    
    @IBAction func hardEgg(_ sender: UIButton) {
        reset()
        softButton.isEnabled = true
        mediumButton.isEnabled = true
        hardButton.isEnabled = false
        nameLabel.text = "Hard"
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(stepBackHard), userInfo: nil, repeats: true)
        }
        SliderButton.minimumValue = 0
        SliderButton.maximumValue = 15
    }
    
    @objc func stepBackSoft (){
        for _ in soft ... 0{
            counterSoft -= 1
                timeLabel.text = "\(counterSoft)"
            SliderButton.value = Float (counterSoft)
        }
        if counterSoft == 0{
            timer.invalidate()
            timeLabel.text = "\(soft)"
            nameLabel.text = "Your egg is ready"
            timer.invalidate()
        }
//        if counterSoft != soft{
//            counterSoft += 1
//                timeLabel.text = "\(counterSoft)"
//            SliderButton.value = Float (counterSoft)
//            print("Soft: \(counterSoft)")
//        }else {
//            timer.invalidate()
//            timeLabel.text = "\(soft)"
//            nameLabel.text = "Your egg is ready"
//            timer.invalidate()
//        }
        }
    
    @objc func stepBackMedium (){
        if counterMed != medium{
            counterMed += 1
                timeLabel.text = "\(counterMed)"
            SliderButton.value = Float (counterMed)
            print("Med: \(counterMed)")
        }else {
            timer.invalidate()
            timeLabel.text = "\(medium)"
            nameLabel.text = "Your egg is ready"
            timer.invalidate()
        }
        }
    
    @objc func stepBackHard (){
        if counterHard != hard{
            counterHard += 1
                timeLabel.text = "\(counterHard)"
            SliderButton.value = Float (counterHard)
            print("Hard: \(counterHard)")
        }else {
            timer.invalidate()
            nameLabel.text = "Your egg is ready"
            timeLabel.text = "\(hard)"
            timer.invalidate()
        }
        }
    
    func reset() {
        softButton.isEnabled = true
        mediumButton.isEnabled = true
        hardButton.isEnabled = true
        nameLabel.text = "Stop"
        SliderButton.value = 0
        counterSoft = 0
        counterMed = 0
        counterHard = 0
        timeLabel.text = "0"
    }
}
    
    


