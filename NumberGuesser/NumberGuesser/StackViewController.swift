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
}

