//
//  DayTimeCalculator.swift
//  DayTimeCalculator
//
//  Created by olddonkey on 2017/1/8.
//  Copyright © 2017年 olddonkey. All rights reserved.
//

import UIKit

enum dayTimeType {
    case sunRise
    case sunSet
}

class DayTimeCalculator: NSObject {
    
    
    /// Provide latitude and longitude to get today's sunset and sunrise time
    ///
    /// - Parameters:
    ///   - lat: The latitude you want to calcuate
    ///   - lng: The longitude you want to calcuate
    ///   - timeType: dayTimeType.sunRise or dayTimeType.sunSet
    /// - Returns: Date(optional)
    public class func getSunRiseSetTime(lat: Double, lng: Double, timeType: dayTimeType) -> Date?{
        
        assert((lat < -90 || lat > 90 || lng > 180 || lng < -180), "Input latitude or longtitude not correct")
        
        let lat = angleToRadians(angle: lat)
        var dayCount: Double = 0
        
        //Get the days count from 2000-01-01 to today
        let shortDateFormatter = DateFormatter()
        shortDateFormatter.dateFormat = "yyyy-MM-dd"
        let currentTime = shortDateFormatter.date(from: shortDateFormatter.string(from: Date()))
        let startTime = shortDateFormatter.date(from: "2000-01-01")
        
        if let currentTime = currentTime, let startTime = startTime{
            let interval = currentTime.timeIntervalSince(startTime)
            dayCount = interval/(24*60*60)
        }
        
        var ut0: Double = 180
        var utStart: Double = 0
        let h: Double = sin(angleToRadians(angle: -0.833))
        
        while abs(utStart - ut0) >= 0.1 {
            let t: Double = (dayCount + ut0 / 360) / 36525
            let L: Double = 280.460 + 36000.777 * t
            let G: Double = angleToRadians(angle: (357.528 + 35999.050 * t))
            let lamda: Double = angleToRadians(angle: (L + 1.915 * sin(G) + 0.020 * sin(2 * G)))
            let epc: Double = angleToRadians(angle: (23.4393 - 0.0130 * t))
            let sigam: Double = asin(sin(epc) * sin(lamda))
            
            let gha: Double = ut0 - 180 - 1.915 * sin(G) - 0.020 * sin(2 * G) + 2.466 * sin(2 * lamda) - 0.053 * sin(4 * lamda)
            
            let e: Double = radiansToAngle(radians: (acos(h - tan(lat) * tan(sigam))))
            
            if timeType == .sunRise {
                utStart = ut0 - gha - lng + e
            }else if timeType == .sunSet {
                utStart = ut0 - gha - lng - e
            }
                        
            ut0 = utStart
        }
        
        var zone: Int = 0
        if lng.truncatingRemainder(dividingBy: 15) >= 7.5 {
            zone = Int(lng / 15) + 1
        }else{
            zone = Int(lng / 15)
        }
        
        let hour = Int(utStart / 15) + zone
        let min = lround(60 * ((utStart) / 15.0 + Double(zone)).truncatingRemainder(dividingBy: 1))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateFormatter.date(from: "\(shortDateFormatter.string(from: Date())) \(hour):\(min)")
        
        return date
    }
}

//Help methods
extension DayTimeCalculator{
    
    fileprivate class func angleToRadians(angle: Double) -> Double{
        return angle * M_PI / 180
    }
    
    fileprivate class func radiansToAngle(radians: Double) -> Double{
        return radians * 180 / M_PI
    }
}
