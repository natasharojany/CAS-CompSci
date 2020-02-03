//
//  ViewController.swift
//  dogFeedInfo
//
//  Created by Natasha Rojany on 2/2/20.
//  Copyright © 2020 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Add: UITextField!
    @IBOutlet weak var feedList: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func fileUrl() -> URL {
        let documentURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("data.json")
    }
    
    @IBAction func addDog(_ sender: Any) {
        let data: [String:String] = [
            "Name": Add.text ?? "N/A",
        ]
        var dogsToSave: [[String:String]] = []
        if var oldDog: [[String:String]] = getJsonData() as [[String:String]]? {
            oldDog.append(data)
            dogsToSave = oldDog
        }
        else {
            dogsToSave = [data]
        }
        
        
        let url = fileUrl()
        if let jsonData = try? JSONSerialization.data(withJSONObject: dogsToSave, options: []) {
            try! jsonData.write(to: url)
            print(data)
            Add.text = ""
        } else {
            print("Saving Failed")
        }
    }
    
    func getJsonData() -> [[String:String]]? {
        let url = fileUrl()
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [[String: String]]? = json as? [[String: String]]
                return dictionary
            }
        }; return nil
    }
    
    
    @IBAction func clearInfo(_ sender: Any) {
        let url = fileUrl()
        try? FileManager.default.removeItem(at:url)
        feedList.text = ""
    }
    
    @IBAction func loadInfo(_ sender: Any) {
        feedList.text = ("")
        let dictionary = getJsonData()
        if let dictionary = dictionary {
            for names in dictionary {
                let name: String = names["Name"]!
                feedList.text = feedList.text! + ("\(name) was fed today \n")
            }
            
            
        }
    }
}




