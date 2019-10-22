//
//  ViewController.swift
//  souppicker
//
//  Created by Natasha Rojany on 10/21/19.
//  Copyright © 2019 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return soupFlavors[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return soupFlavors.count
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Flavors: UIPickerView!
    let soupFlavors = [ "Tomato Soup", "Chicken Noodle Soup", "Miso Soup", "Pho", "Split Pea Soup", "Lentil Soup", "Udon Noodle Soup", "Matzaball Soup"]
    let price = ["$4.58", "$6.00", "$3.26","$5.00","$5.00", "$5.99","$4.58","$4.00", "6.00", "6.50"]
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func orderButton(_ sender: Any) {
        let row = Flavors.selectedRow(inComponent:0)
        Label.text = "You ordered: " + soupFlavors[row] + " it costs " + price[row]
    }
    
    

}

