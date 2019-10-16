//
//  ViewController.swift
//  Picker
//
//  Created by Natasha Rojany on 10/16/19.
//  Copyright © 2019 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaFlavors[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaFlavors.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var ToppingPicker: UIPickerView!
    let pizzaFlavors = ["Hawaiian", "White", "Meat Lovers", "Cheese", "Veggie", "Mini", "Peporoni", "Margarita"]
    
    @IBOutlet weak var Label: UITextField!
    
    @IBAction func OrderButton(_ sender: Any) {
        let row = ToppingPicker.selectedRow(inComponent:0)
        Label.text = "You ordered a: " + pizzaFlavors[row]

    }
    
}

