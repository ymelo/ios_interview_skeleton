//
//  DateExtensions.swift
//  InterviewStoryboard
//
//  Created by Ian Turner on 13/05/2020.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import Foundation

extension Date {
    func meetingFormat() -> String {
        let format = DateFormatter.dateFormat(fromTemplate: "HH:mm - MMM dd", options: 0, locale: Locale.current) ?? "n/a"
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self as Date)
        
    }
}
