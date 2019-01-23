//
//  ViewController.swift
//  BullsEye
//
//  Created by Peter Phanouvong on 22/11/18.
//  Copyright © 2018 Peter Phanouvong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0 // init a placeholder for value of the slider
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider! // allows us to reference the slider anywhere in the program
    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded() // get the current value of the slider
        currentValue = Int(roundedValue)
        startOverButton()
    }
    
    @IBAction func showAlert() {
        
        let difference: Int = abs(currentValue - targetValue)
        var points = 100 - difference
        if (points == 100) {
            points = 200
        } else if (points == 99){
            points = 150
        }
        
        score += points
        
        let message = "You scored: \(points) points"
        let alert = UIAlertController(title: checkGuess(difference: difference), message: message, preferredStyle: .alert) //step 1 (make controller)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        }) // step 2 (make action)
        alert.addAction(action) // step 3 (hooking them together)
        present(alert, animated: true, completion: nil) // step 4 (present the alert)

    }
    
    @IBAction func sliderMoved(_ slider: UISlider) { // reads the current value of slider when moved, stores in currentValue
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func startOverButton(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels() {
        randomNumberLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func checkGuess(difference: Int) -> String {
        let string: String
        
        if(difference == 0){
            string = "PERFECT!"
        } else if (difference == 1) {
            string = "ONE OFF!"
        } else if (difference < 10){
            string = "SO CLOSE"
        } else if (difference < 25){
            string = "Pretty Good"
        } else if (difference < 50) {
            string = "You can do better"
        } else {
            string = "Not even close..."
        }
        return string
    }

}

