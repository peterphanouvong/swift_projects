//
//  ViewController.swift
//  War
//
//  Created by Peter Phanouvong on 14/11/18.
//  Copyright © 2018 Peter Phanouvong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    var leftScore = 0
    var rightScore = 0
    
    @IBAction func dealTapped(_ sender: Any) {
        let leftRandomNumber = arc4random_uniform(13) + 2
        
        let rightRandomNumber = arc4random_uniform(13) + 2
        
        
        leftImageView.image = UIImage(named: "card\(leftRandomNumber)")
        
        rightImageView.image = UIImage(named: "card\(rightRandomNumber)")
        
        if leftRandomNumber < rightRandomNumber {
            rightScore = rightScore + 1
            rightScoreLabel.text = String(rightScore)
        } else if leftRandomNumber > rightRandomNumber {
            leftScore = leftScore + 1
            leftScoreLabel.text = String(leftScore)
        }
        
        
    }
    

}

