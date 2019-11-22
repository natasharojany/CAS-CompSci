//
//  ViewController.swift
//  age finder
//
//  Created by Natasha Rojany on 9/19/19.
//  Copyright © 2019 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var bdayswitch: UISwitch!
    @IBOutlet var birthYear: UIView!
    @IBOutlet weak var ageButton: UIButton!
    @IBOutlet weak var answer: UILabel!
    
    var agee:Int?
    var birthYearr = 0
    var currentYear = 2019
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func ageButton(_ sender:UIButton) {
        agee = Int(age.text ?? "0")
        
        if bdayswitch.isOn {
            birthYearr += 0
        } else {
            birthYearr -= 1
        }
    
        birthYearr += currentYear
        birthYearr -= agee!
        
        answer.text = "Your birth year is\( birthYearr)"
        
        birthYearr = 0
    
    }
}

