# DayTimeCalculator
</p>

A small library to calculate sun rise and sun set time. Provide latitude and longitude, return an UTC Date that's day's sun rise or sun set time

## Features

- [x] Only need latitude and longitude, no need for network
- [x] One line to use this service


## Usage

Use CocoaPods or Cathage or just pull the DayTimeCalculator.swift file into your project.

### CocoaPods:
To integrate DayTimeCalculator into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'your_app' do
  pod 'DayTimeCalculator', '~> 1.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

You should open the `{Project}.xcworkspace` instead of the `{Project}.xcodeproj` after you installed anything from CocoaPods.

### Manully:
Drag the DayTimeCalculator.swift file into your project

```swift
//date is the returned valued
let date = DayTimeCalculator.getSunRiseSetTime(date: Your date(Date() Type), lat: Your latitude, lng: Your longtitude, timeType: .sunRise or .sunSet)
```

## Requirements

- iOS 8.0+ 
- Swift 3 

The main development of DayTimeCalculator is based on Swift 3.

### Contact

Follow and contact me through [email](olddonkeyblog@gmail.com). If you find an issue, just [open a ticket](https://github.com/olddonkey/DayTimeCalculator/issues/new) on it. Pull requests are warmly welcome as well.

### License

DayTimeCalculator is released under the MIT license. See LICENSE for details.


