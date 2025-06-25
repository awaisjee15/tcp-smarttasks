//
//  TaskService.swift
//  SmartTasks
//
//  Created by AwaisSalim on 23/06/2025.
//

import Foundation

class TaskService{
    let config: ConfigurationProtocol
    let apiClient: APIClientProtocol
    let url: URL
    
    init(config: ConfigurationProtocol = AppConfiguration(), apiClient: APIClientProtocol = APIClient()) {
        self.config = config
        self.apiClient = apiClient
        self.url = URL(string: config.baseURL)!
    }
    
    
    
    func fetchTasks(completion: @escaping (Result<[Task], Error>) -> Void) {
        apiClient.request(url: url, method: .get) { (result: Result<TaskResponse, Error>) in
            switch result {
            case .success(let response):
                
                completion(.success(response.tasks))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
