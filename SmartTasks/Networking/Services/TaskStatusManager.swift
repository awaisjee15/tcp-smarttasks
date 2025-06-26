//
//  TaskStatusManager.swift
//  SmartTasks
//
//  Created by AwaisSalim on 26/06/2025.
//

import SwiftUI

public enum TaskStatus: String {
    case unresolved
    case resolved
    case cannotResolve
}



class TaskStatusManager {
    private static let key = "TaskStatuses"

    static func getStatus(for taskID: String) -> TaskStatus {
        let data = UserDefaults.standard.dictionary(forKey: key) as? [String: String] ?? [:]
        return TaskStatus(rawValue: data[taskID] ?? "unresolved") ?? .unresolved
    }

    static func setStatus(_ status: TaskStatus, for taskID: String) {
        var data = UserDefaults.standard.dictionary(forKey: key) as? [String: String] ?? [:]
        data[taskID] = status.rawValue
        UserDefaults.standard.setValue(data, forKey: key)
    }
}
