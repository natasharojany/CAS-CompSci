//
//  ViewController.swift
//  rickAndMorty
//
//  Created by Natasha Rojany on 12/18/19.
//  Copyright © 2019 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in (1...493) {
            numbers.append(String(i))
        }
    }
    
    @IBOutlet weak var InfoLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    var numbers: [String] = []
    
    @IBAction func Button(_ sender: Any) {
        let number = pickerView.selectedRow(inComponent: 0) + 1
        let url: URL = URL(string: "https://rickandmortyapi.com/api/character/\(number)")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    if let name: String = dictionary["name"] as? String,
                    let status: String = dictionary["status"] as? String,
                    let species: String = dictionary["species"] as? String,
                    //let origin: String = dictionary["origin"] as? String,
                  //  let location: String? = dictionary["location"] as? String,
                    let gender: String = dictionary["gender"] as? String
                        {
                    
                        InfoLabel.text = "Name: \(name)\n Status: \(status)\n Species: \(species)\n Origin: origin\n Gender: \(gender)\n Location: location"
                    }
                    
                } else { print("dictionary failed") }
            } else { print("json failed") }
        } else { print("responseData failed") }
    }
    
    
}

