//
//  ViewController.swift
//  NumberGuesser
//
//  Created by Natasha Rojany on 2/19/20.
//  Copyright © 2020 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let stackView = segue.destination as? StackViewController, let sender = sender as? UIButton {
            if sender == easyButton {
                stackView.dif = "easy"
            }
            if sender == mediumButton {
                stackView.dif = "medium"
            }
            if sender == hardButton {
                stackView.dif = "hard"
            }
        }
    }

}

