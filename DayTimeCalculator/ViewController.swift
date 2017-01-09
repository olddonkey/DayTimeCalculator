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
        let date = DayTimeCalculator.getSunRiseSetTime(lat: 30.328, lng: -97.729, timeType: .sunRise)
        print(date!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

