//
//  Extension+DateFormatter.swift
//  SmartTasks
//
//  Created by AwaisSalim on 24/06/2025.
//

import Foundation

extension DateFormatter {
    static let taskDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
