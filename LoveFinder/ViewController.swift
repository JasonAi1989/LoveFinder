//
//  ViewController.swift
//  LoveFinder
//
//  Created by jason on 15/8/30.
//  Copyright (c) 2015年 JasonAi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var hight: UILabel!
    @IBOutlet weak var hasProperty: UISwitch!
    @IBOutlet weak var showResult: UITextView!
    @IBOutlet weak var hightNumber: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func hightChanged(sender: AnyObject) {
        
        hight.text = "\(Int(floorf(hightNumber.value)))厘米"
    }
    
  
    @IBAction func makeSure(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex == 0 ? "高富帅" : "白富美"

        var dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        var birthdayDate = dateFormat.stringFromDate(birthday.date)
        
        var gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        var now = NSDate()
        
        var components = gregorian?.components(NSCalendarUnit.CalendarUnitYear, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(0))
        var age = components?.year
        
        let house = hasProperty.on ? "在北京拥有一套豪宅" : "和朋友蜗居北京"
        
        var result = "我叫\(name.text)，是一名\(genderText)，我的生日是\(birthdayDate)，所以我现在\(age!)岁，我的身高是\(hight.text!)，我现在\(house)"
        
        showResult.text = result
    }
    
    //处理键盘按下return后的操作
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        name.resignFirstResponder()  //会让键盘消失
        return true
    }
}

