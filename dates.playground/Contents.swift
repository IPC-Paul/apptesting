//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let curDate = NSDate()
let dateFormatter = NSDateFormatter()
let calendar = NSCalendar.currentCalendar()

dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
var convertedDate = dateFormatter.stringFromDate(curDate)

var newDateString = "201604221600"
dateFormatter.dateFormat = "yyyyMMddHHmm"

var enteredDate = dateFormatter.dateFromString(newDateString)

let components = calendar.components([.Day, .Weekday, .Month, .Hour, .Minute], fromDate: enteredDate!)

print ("day = \(components.day), weekday = \(components.weekday)")

