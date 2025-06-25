//
//  Task.swift
//  SmartTasks
//
//  Created by AwaisSalim on 23/06/2025.
//

struct Task: Identifiable, Codable{
    let id : String
    let targetDate : String
    let dueDate : String?
    let title : String
    let description : String
    let priority : Int?
    
    
    
    enum CodingKeys: String, CodingKey{
        case id
        case targetDate = "TargetDate"
        case dueDate = "DueDate"
        case title = "Title"
        case description = "Description"
        case priority = "Priority"
    }
}


