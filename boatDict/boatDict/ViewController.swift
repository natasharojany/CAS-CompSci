//
//  ViewController.swift
//  boatDict
//
//  Created by Natasha Rojany on 11/8/19.
//  Copyright © 2019 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var boat: Boat? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var otherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var name = boat?.name
        var color = boat?.color
        var dolphinPower = boat?.dolphinPower
        var size = boat?.size
        // Do any additional setup after loading the view.
        nameLabel.text = name
        otherLabel.text = "\(color!)  \(dolphinPower!) \(size!)"
    }


}

