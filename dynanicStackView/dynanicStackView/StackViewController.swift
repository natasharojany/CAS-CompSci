//
//  StackViewController.swift
//  dynanicStackView
//
//  Created by Natasha Rojany on 2/6/20.
//  Copyright © 2020 Natasha Rojany. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    
    var labelCount = 15
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labels = (1...labelCount).map({ (x) -> UILabel in
            let newLabel = UILabel()
            newLabel.text = "Hiiii #\(x)"
            return newLabel
        })
        
        for (x, label) in labels.enumerated() {
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 1)
            if label != labels[0] {
                stackView.addConstraint(constraint)
            }
        }
    }
}
