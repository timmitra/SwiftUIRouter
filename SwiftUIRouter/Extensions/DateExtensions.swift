//
//  DateExtensions.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import SwiftUI

extension Date {
//    static func from(year: Int, month: Int, day: Int) -> Date {
//        let calendar = Calendar.current
//        var dateComponents = DateComponents()
//        dateComponents.year = year
//        dateComponents.month = month
//        dateComponents.day = day
//        return calendar.date(from: dateComponents) ?? .init()
//    }
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components) ?? Date()
    }
}
