//
//  ViewController.swift
//  RightNumber
//
//  Created by Роман Зобнин on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    @IBOutlet var nextVcButton: UIButton!
    @IBOutlet var slider:  UISlider!
    @IBOutlet var numberLabel: UILabel!
    
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        }else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    private func updateLabelWithSecretNumber(newText: String){
        numberLabel.text = newText
    }
    
    private func showAlertWith (score:Int){
        let alert = UIAlertController(title: "Игра окончена", message: "Вы набрали \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

