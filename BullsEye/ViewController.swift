//
//  ViewController.swift
//  BullsEye
//
//  Created by Cora-Jane Meade on 22/10/2018.
//  Copyright © 2018 Cora-Jane Meade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
//    figures out the type of the value depending on the type of intial value (alt and click)
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
       // let targetValue = targetLabel.value
        //    let thumbImageNormal = UIImage(named: "sliderthumb-normal")!
        let thumbImageNormal = #imageLiteral(resourceName: "sliderthumb-normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
//        let thumbImageHighlighted = #imageLiteral(resourceName: "sliderthumb-highlighted")
//        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
//        
//        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 0)
//        
//        let trackLeftImage = #imageLiteral(resourceName: "green")
//        let trackLeftImageResizable = trackLeftImage.resizableImage(withCapInsets: insets)
//        slider.setMinimumTrackImage(trackLeftImageResizable, for: .normal)
//        
//        let trackRightImage = #imageLiteral(resourceName: "white")
//        let trackRightImageResizable = trackRightImage.resizableImage(withCapInsets: insets)
//        slider.setMaximumTrackImage(trackRightImageResizable, for: .normal)
    }

    @IBAction func showAlert() {
        
        let difference = abs (targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
//        let message = "The target value is: \(targetValue)" +
//        "\nThe value of the slider is now: \(currentValue)" +
//        "\nThe diffference is: \(difference)"
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
    
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        //print("The slider value: \(slider.value)")
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
}

