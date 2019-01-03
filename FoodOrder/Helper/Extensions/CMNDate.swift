//
//  CMNDate.swift
//  comon
//
//  Created by Ankit on 3/23/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation

extension Date {
    
    static func getDaysBetweenTwoDate( startDate: inout String, endDate: inout String) -> String {
        
        let startDateFormater = DateFormatter()
        
        startDate = startDate.replacingOccurrences(of: "T", with: " ")
        startDate = startDate.components(separatedBy: ".")[0]
        
        endDate = endDate.replacingOccurrences(of: "T", with: " ")
        endDate = endDate.components(separatedBy: ".")[0]
        
        startDateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let startDateObj = startDateFormater.date(from: startDate)
        let endDateObj = startDateFormater.date(from: endDate)
        
        let components = Set<Calendar.Component>([.second, .minute, .hour, .day, .month, .year])
        let differenceOfDate = Calendar.current.dateComponents(components, from: startDateObj!, to: endDateObj!)
        
        return "\(differenceOfDate.day!) \(differenceOfDate.day == 1 ? "day" : "days") to go!"
        
    }
    
    static func getStartAndEndDate(startDate: String, endDate: String) -> String {
        
        let startDateFormater = DateFormatter()
        let endDateFormater = DateFormatter()
        startDateFormater.dateFormat = "MM/dd/yyyy HH:mm:ss a"
        endDateFormater.dateFormat = "MM/dd/yyyy HH:mm:ss a"
        startDateFormater.timeZone = TimeZone(abbreviation: "UTC")
        endDateFormater.dateFormat = "MM/dd/yyyy HH:mm:ss a"
        let startDate = startDateFormater.date(from: startDate)
        let endDate = startDateFormater.date(from: endDate)
        
        let components = Set<Calendar.Component>([.second, .minute, .hour, .day, .month, .year])
        let differenceOfStartDate = Calendar.current.dateComponents(components, from: Date(), to: startDate!)
        let differenceOfEndDate = Calendar.current.dateComponents(components, from: Date(), to: endDate!)
        
      
        
        var strDate = ""
        
        if differenceOfStartDate.day! > 0 {
            strDate = "Starts in \(differenceOfStartDate.day!) \(differenceOfStartDate.day! == 1 ? "Date" : "Days")"
        } else if differenceOfEndDate.day! > 0 {
            strDate = "Ends in \(differenceOfStartDate.day!) \(differenceOfStartDate.day! == 1 ? "Date" : "Days")"
        } else {
            strDate = "Ended"
        }
        
        return strDate
        
    }
    
    static func getEndedStringDate(startDate: String) -> String {
        let startDateFormater = DateFormatter()
        startDateFormater.dateFormat = "MM/dd/yyyy HH:mm:ss a"
        let endDate = startDateFormater.date(from: startDate)
        startDateFormater.dateFormat = "dd.MM.yyyy"
        return "ended \(startDateFormater.string(from: endDate!))"
    }
    
    static func getMessageTime(date: String) -> String {
        let startDateFormater = DateFormatter()
        
        var startDate = date.replacingOccurrences(of: "T", with: " ")
        startDate = startDate.components(separatedBy: ".")[0]
        startDateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        startDateFormater.timeZone = TimeZone(abbreviation: "UTC")
        let startDateObj = startDateFormater.date(from: startDate)
        
        startDateFormater.dateFormat = "hh:mm a"
        startDateFormater.timeZone = TimeZone.current
        return startDateFormater.string(from: startDateObj!)
    }
    
    static func getMessageDate(date: String) -> String {
        let startDateFormater = DateFormatter()
        
        var startDate = date.replacingOccurrences(of: "T", with: " ")
        startDate = startDate.components(separatedBy: ".")[0]
        startDateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        startDateFormater.timeZone = TimeZone(abbreviation: "UTC")
        let startDateObj = startDateFormater.date(from: startDate)
        
        startDateFormater.dateFormat = "yyyy-MM-dd"
        startDateFormater.timeZone = TimeZone.current
        return startDateFormater.string(from: startDateObj!)
    }
    
    
    static func getCampaignInfoDate( startDate: inout String, endDate: inout String) -> (status: String, days: String, hours: String) {
        
        let startDateFormater = DateFormatter()
        
        startDate = startDate.replacingOccurrences(of: "T", with: " ")
        startDate = startDate.components(separatedBy: ".")[0]
        
        endDate = endDate.replacingOccurrences(of: "T", with: " ")
        endDate = endDate.components(separatedBy: ".")[0]
        
        startDateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let startDate = startDateFormater.date(from: startDate)
        let endDate = startDateFormater.date(from: endDate)
        
        let components = Set<Calendar.Component>([.second, .minute, .hour, .day, .month, .year])
        let differenceOfStartDate = Calendar.current.dateComponents(components, from: Date(), to: startDate!)
        let differenceOfEndDate = Calendar.current.dateComponents(components, from: Date(), to: endDate!)
        
        print("\(differenceOfStartDate.day!)")
        print("\(differenceOfStartDate.hour!)")
        
        if differenceOfStartDate.day! >= 0 && differenceOfStartDate.hour! > 0 {
            return ("Start", "\(differenceOfStartDate.day!)","\(differenceOfStartDate.hour!)")
        } else if differenceOfEndDate.day! >= 0 && differenceOfEndDate.hour! > 0 {
            return ("End", "\(differenceOfEndDate.day!)","\(differenceOfEndDate.hour!)")
        } else {
            return ("Ended", "\(differenceOfStartDate.day!)","\(differenceOfStartDate.hour!)")
        }
        
    }
    
    static func convertDate(date: String, formater: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let startDateFormater = DateFormatter()
        startDateFormater.dateFormat = formater
        return startDateFormater.date(from: date)!.getElapsedInterval()
    }
    
    static func convertDateToValidDate(date: String, formater: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let startDateFormater = DateFormatter()
        startDateFormater.dateFormat = formater
        let dateObj = startDateFormater.date(from: date)
        startDateFormater.dateFormat = "dd MMMM"
        
        return "Valid Till \(startDateFormater.string(from: dateObj!))"
    }
    
    static func convertDateToValidDateDetail(date: String, formater: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let startDateFormater = DateFormatter()
        startDateFormater.dateFormat = formater
        let dateObj = startDateFormater.date(from: date)
        startDateFormater.dateFormat = "MMM dd, yyyy hh:mm a"
        
        return "\(startDateFormater.string(from: dateObj!))"
    }
    //Aug 31, 2018 23:59 PM.
    
}

extension Date {
    
    func getElapsedInterval() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" :
                "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" :
                "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" :
                "\(day)" + " " + "days ago"
        } else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + "hour ago" :
                "\(hour)" + " " + "hours ago"
        } else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + "minute ago" :
                "\(minute)" + " " + "minutes ago"
        } else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " " + "second ago" :
                "\(second)" + " " + "seconds ago"
        } else {
            return "a moment ago"
        }
        
    }
}
