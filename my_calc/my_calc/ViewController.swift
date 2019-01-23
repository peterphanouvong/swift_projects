//
//  ViewController.swift
//  my_calc
//
//  Created by Peter Phanouvong on 16/11/18.
//  Copyright © 2018 Peter Phanouvong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numbersOnScreen: [Double] = [0,0]
    var numberTracker = ""
    var operation = 0
    var i = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        resultLabel.text = resultLabel.text! + String(sender.tag-1)
        numberTracker = numberTracker + String(sender.tag-1)
        print(numberTracker)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if(sender.tag <= 17 && sender.tag > 12){
            numbersOnScreen[i] = Double(numberTracker)!
            print(numbersOnScreen[0])
            print(numbersOnScreen[1])
            numberTracker = ""
            i = i + 1
        }
        
        switch sender.tag {
            
        case 0:
            resultLabel.text = resultLabel.text! + "."
            break
        case 11:
            resultLabel.text = ""
            break
        case 13:
            resultLabel.text = resultLabel.text! + "÷"
            operation = 1
            break
        case 14:
            resultLabel.text = resultLabel.text! + "×"
            operation = 2
            break
        case 15:
            resultLabel.text = resultLabel.text! + "-"
            operation = 3
            break
        case 16:
            resultLabel.text = resultLabel.text! + "+"
            operation = 4
            break
        case 17:
            if(operation == 1){
                resultLabel.text = String(numbersOnScreen[0] / numbersOnScreen[1])
                
            } else if(operation == 2){
                resultLabel.text = String(numbersOnScreen[0] * numbersOnScreen[1])
            } else if(operation == 3){
                resultLabel.text = String(numbersOnScreen[0] - numbersOnScreen[1])
                
            } else if(operation == 4){
                resultLabel.text = String(numbersOnScreen[0] + numbersOnScreen[1])
                
            } else {
            }
            i = 0
            break
            
        default:
            resultLabel.text = "lol eat dick"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    
}



