//
//  ViewController.swift
//  RightNumber
//
//  Created by Роман Зобнин on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    var round: Int = 1
    var point: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.numberLabel.text = String(self.number)
        
    }
    @IBOutlet var nextVcButton: UIButton!
    @IBOutlet var slider:  UISlider!
    @IBOutlet var numberLabel: UILabel!
    
}

