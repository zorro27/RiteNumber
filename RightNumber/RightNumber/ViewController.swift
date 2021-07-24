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
    
//    lazy var secondVC: SecondViewController = getSeconfVC()
//
//    private func getSeconfVC () -> SecondViewController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "SecondViewController")
//        return vc as! SecondViewController
//    }
    @IBAction func showNextVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func checkNumber() {
            let numSlider = Int(self.slider.value.rounded())
            if numSlider > self.number {
                self.point += 50 - self.number + numSlider
            } else if numSlider < self.number {
                self.point += 50 - numSlider + self.number
            } else {
                self.point += 50
            }
        
        if self.round == 5 {
            let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(self.point) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.point = 0
        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
        self.numberLabel.text = String(self.number)
    }
}

