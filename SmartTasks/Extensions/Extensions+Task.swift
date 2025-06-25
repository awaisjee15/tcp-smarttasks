//
//  Extensions+Task.swift
//  SmartTasks
//
//  Created by AwaisSalim on 24/06/2025.
//

import SwiftUI

extension Task {
    var targetDateValue: Date? {
        DateFormatter.taskDateFormatter.date(from: targetDate)
    }
    
    var dueDateValue: Date? {
        DateFormatter.taskDateFormatter.date(from:  dueDate ?? "")
    }
    
    var daysLeft: Int? {
        guard let target = targetDateValue, let due = dueDateValue else { return nil }
        return Calendar.current.dateComponents([.day], from: target, to: due).day
    }
}
