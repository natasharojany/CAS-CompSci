//
//  ViewController.swift
//  jsonDecodeApp
//
//  Created by Riley John Gibbs on 12/3/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?
    
    // TODO: Come up with a better UI than just a single boring label.

    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
        
        
       // let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options: [])
            let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options: [])
            
            let dictionary = json as! [String: Any]
            let advisor: String = dictionary["advisor"] as! String
            let classes: [String] = dictionary["classes"] as! [String]
            let grade: Int = dictionary["grade"] as! Int
            // This just puts the file contents (unparsed) into the label.
            if let string = jsonFileString {
                Label.text = string
            }
            
            if jsonFileData != nil {
                // TODO: Parse the JSON data and display it in the app.
            }
        }
    }
    
}

