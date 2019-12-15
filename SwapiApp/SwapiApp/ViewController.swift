//
//  ViewController.swift
//  SwapiApp
//
//  Created by Natasha Rojany on 12/11/19.
//  Copyright © 2019 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Button(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/4/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    let releaseYear: String? = dictionary["releaseYear"] as? String
                    if let title = title {
                        Label.text = "Title: \(title) was released in \(releaseYear ?? "cant find") and was produced by \(producer ?? "cant find")"
                    }
                }
            }
        }
    }
       

    @IBAction func Button2(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    let releaseYear: String? = dictionary["releaseYear"] as? String
                    if let title = title {
                        Label.text = "Title: \(title) was released in \(releaseYear ?? "cant find") and was produced by \(producer ?? "cant find")"
                    }
                }
            }
        }

    }
    
    
    @IBAction func Button3(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/5/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    let releaseYear: String? = dictionary["releaseYear"] as? String
                    if let title = title {
                        Label.text = "Title: \(title) was released in \(releaseYear ?? "cant find") and was produced by \(producer ?? "cant find")"
                    }
                }
            }
        }

    }
    // Do any additional setup after loading the view.
    }


