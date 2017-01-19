//
//  ViewController.swift
//  DayTimeCalculator
//
//  Created by olddonkey on 2017/1/8.
//  Copyright © 2017年 olddonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let date = DayTimeCalculator.getSunRiseSunSetTimeUseSystemTimeZone(date: Date(), lat: 47.625668, lng: -122.341470, timeType: .sunSet)//Seattle time and GPS location
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date!)
        print(dateString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

