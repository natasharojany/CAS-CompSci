//
//  Stack2ViewController.swift
//  dynanicStackView
//
//  Created by Natasha Rojany on 2/6/20.
//  Copyright © 2020 Natasha Rojany. All rights reserved.
//

import UIKit

class Stack2ViewController: UIViewController {

    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.addTarget(self, action:#selector(addButton), for: .touchUpInside )
        // Do any additional setup after loading the view.
    }
    @objc func showAlert() {
        let alert = UIAlertController(title: "Hello!", message: "How is your day going?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Goodbye!", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func addButton() {
        let newButton = UIButton()
        newButton.setTitle("PRESS ME", for: .normal)
        newButton.setTitleColor(UIColor(displayP3Red: 1, green: 0, blue: 60, alpha: 1), for: .normal)
        newButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        stackView.addArrangedSubview(newButton)

    }
}
