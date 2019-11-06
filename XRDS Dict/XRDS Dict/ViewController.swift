//
//  ViewController.swift
//  XRDS Dict
//
//  Created by Natasha Rojany on 11/1/19.
//  Copyright © 2019 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    
    var vocabWord:String?
    var vocabDefinition:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = vocabWord
        defLabel.text = vocabDefinition
    }


}

