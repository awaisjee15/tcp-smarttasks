//
//  TaskListViewModel.swift
//  SmartTasks
//
//  Created by AwaisSalim on 23/06/2025.
//

import Foundation

@MainActor
class TaskListViewModel : ObservableObject{
    
    @Published var allTasks: [Task] = []
    
    @Published var filteredTasks: [Task] = []
    
    @Published var selectedDate: Date = Date()
    
    @Published var isLoading = false
    
    @Published var errorMessage: String?
    
    private let taskService: TaskService
    
    init(taskService: TaskService = TaskService()) {
        self.taskService = taskService
    }
    
    func loadTasks(){
        isLoading = true
        errorMessage = nil
        taskService.fetchTasks { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let tasks):
                    self?.allTasks = tasks
                    self?.updateFilteredTasks()
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    
    func updateFilteredTasks() {
        filteredTasks = allTasks
            .filter { task in
                guard let taskDate = task.targetDateValue else { return false }
                return Calendar.current.isDate(taskDate, inSameDayAs: selectedDate)
            }
            .sorted { a, b in
                let aPriority = a.priority ?? 0
                let bPriority = b.priority ?? 0
                
                if aPriority != bPriority {
                    return aPriority > bPriority
                } else {
                    guard let aDate = a.targetDateValue,
                          let bDate = b.targetDateValue else {
                        return false
                    }
                    return aDate < bDate
                }
            }
    }
    
    
    func goToNextDay() {
        selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
        updateFilteredTasks()
    }
    
    func goToPreviousDay() {
        selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
        updateFilteredTasks()
    }
    
}
