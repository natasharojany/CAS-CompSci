//
//  StackViewController.swift
//  NumberGuesser
//
//  Created by Natasha Rojany on 2/19/20.
//  Copyright © 2020 Natasha Rojany. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    
    var dif = String()
    
    func checkDif()-> Int{
        if dif == "easy" {
            let buttonCount = 15
            return buttonCount
        }
        else if dif == "medium" {
            let buttonCount = 30
            return buttonCount
        }else{
            let buttonCount = 45
            return buttonCount
        }
    }
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = (1...checkDif()).map({ (x) -> UIButton in
            let newButton = UIButton()
            newButton.setTitle("Guess #\(x)", for: .normal)
            newButton.setTitleColor(UIColor(displayP3Red: 1, green: 0, blue: 60, alpha: 1), for: .normal)
            return newButton
        })
        
        for (x, button) in buttons.enumerated() {
            //button.textAlignment = .center
            stackView.addArrangedSubview(button)
            let constraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: buttons[0], attribute: .height, multiplier: 1, constant: 1)
            if button != buttons[0] {
                stackView.addConstraint(constraint)
            }
        }
    }
    
    
    
    @objc func buttonAction() {
        let trueDifficulty = checkDif()
        let number = Int.random(in: 1...trueDifficulty)
        let buttons = (1...trueDifficulty).map({ (x) -> UIButton in
            let newButton = UIButton()
            newButton.setTitle("Button \(x)", for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 400, height: 25)
            newButton.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.3, blue: 0.6, alpha: 1)
            if x > number {
                newButton.addTarget(self, action: #selector(tooHigh), for: .touchUpInside)
            }
            else if x < number {
                newButton.addTarget(self, action: #selector(tooLow), for: .touchUpInside)
            }else{
                newButton.addTarget(self, action: #selector(justRight), for: .touchUpInside)
            }
            return newButton
        })
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height:trueDifficulty*45)
        //scrollView.contentSize = CGSize(width: 400, height: trueDifficulty*45
        stackView.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.3, blue: 0.6, alpha: 1)
        //scrollView.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.3, blue: 0.6, alpha: 1)
        for button in buttons{
            stackView.addArrangedSubview(button)
            let constraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: buttons[0], attribute: .height, multiplier: 1, constant: 0)
            if button != buttons[0] {
                stackView.addConstraint(constraint)
            }
        }
    }
    @objc func tooLow(){
        let alert = UIAlertController(title: "not gonna work, try again", message: "too low", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GO", style: .default))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func tooHigh(){
        let alert = UIAlertController(title: "not gonna work, try again", message: "too high", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GO", style: .default))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func justRight(){
        let alert = UIAlertController(title: "woohoo!!! you did it!!!", message: "Try a harder level", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GO", style: .default))
        self.present(alert, animated: true, completion: {})
    }
}


