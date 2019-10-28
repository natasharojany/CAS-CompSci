//
//  ViewController.swift
//  mySchedule
//
//  Created by Natasha Rojany on 10/23/19.
//  Copyright © 2019 Natasha Rojany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let mySchedule:[String:String]=[
        "A": "CAS Physics",
        "B": "CAS CompSci",
        "C": "CAS HSE",
        "D": "English",
        "E": "Calculus",
        "F": "Free",
        "M": "Life Skills",
        "T/F": "Yearbook",
        "W/T": "Free"
    ]

    var curDayType = "A"
    var curWeekday = "Monday"
    var curSchedule = "Regular Schedule"
    
    let dayTypes:[String]=["A", "B", "C"]
    let weekdays:[String]=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let schedule:[String]=["Regular Schedule","Assembly Schedule", "Double BLock Schedule", "Special Assembly Schedule"]
    
    let periodRoation: [String:[String:[String]]] = [
        "A":[
            "Monday": ["A","B","D","E","M","M"],
            "Tuesday": ["A","B","D","E","T/F","T/F"],
            "Wednesday": ["A","B","D","E","W/T","W/T"],
            "Thursday": ["A","B","D","E","W/T","W/T"],
            "Friday":["A","B","D","E","T/F","T/F"],
            ],
        "C":[
            "Monday": ["C","A","F","D","M","M"],
            "Tuesday": ["C","A","F","D","T/F","T/F"],
            "Wednesday": ["C","A","F","D","W/T","W/T"],
            "Thursday": ["C","A","F","D","W/T","W/T"],
            "Friday":["C","A","F","D","T/F","T/F"],
            ],
        "B":[
            "Monday": ["B","C","E","F","M","M"],
            "Tuesday": ["B","C","E","F","T/F","T/F"],
            "Wednesday": ["B","C","E","F","W/T","W/T"],
            "Thursday": ["B","C","E","F","W/T","W/T"],
            "Friday":["B","C","E","F","T/F","T/F"],
            ]
            ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return dayTypes.count
        }
        else if component == 1{
            return weekdays.count
        } else {
            return schedule.count
        }
    }
    
    func getScheduleForDay(periods:[String], mySchedule:[String:String]) -> String{
        var output = ""
        for period in periods{
            output += "\(period) - "
            output += mySchedule[period] ?? "Free"
            output += "\n"
        }
        return output
    }
    @IBOutlet weak var Picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBAction func getSchedule(_ sender: Any) {
        let dayTypeRow = Picker.selectedRow(inComponent: 0)
        let ACBDay = dayTypes[dayTypeRow]
        let weekDayRow = Picker.selectedRow(inComponent: 1)
        let dayOfWeek = weekdays[weekDayRow]
        let mySched = getScheduleForDay(periods: periodRoation[ACBDay]![dayOfWeek]!, mySchedule: mySchedule)
        label.text = mySched
    }
    
  
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return dayTypes[row]
        }
        else if component == 1{
            return weekdays[row]
        }else {
            return schedule[row]
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if component == 0{
            curDayType = dayTypes[row]
        }
        else if component == 1{
            curWeekday = weekdays[row]
        } else{
            curSchedule = schedule[row]
        }
    }
}

