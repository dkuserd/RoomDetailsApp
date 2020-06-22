//
//  Date+Extensions.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 21/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation

extension Date {
    
    func getFormattedDate() -> (day: String,
        month: String,
        year: Int,
        hourMinSuffix: String,
        hourMin: String) {
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            dateFormatter.dateFormat = "LLL"
            let nameOfMonth = dateFormatter.string(from: self)
            
            let calendar = Calendar.current
            let day = calendar.component(.day, from: self)
            var dayOfMonth: String = ""
            switch day {
                case 1, 21, 31:
                dayOfMonth = "\(day)st"
                case 2, 22:
                dayOfMonth = "\(day)nd"
            case 3, 23:
                dayOfMonth = "\(day)rd"
            default:
                dayOfMonth = "\(day)th"
            }
            
            let year = calendar.component(.year, from: self)
            
            dateFormatter.dateFormat = "h:mm a"
            dateFormatter.amSymbol = "AM"
            dateFormatter.pmSymbol = "PM"
            let hourMinSuffix = dateFormatter.string(from: self)
            
            dateFormatter.dateFormat = "HH:mm"
            let hourMin = dateFormatter.string(from: self)
            
            return(dayOfMonth, nameOfMonth, year, hourMinSuffix, hourMin)
            
    }
}
