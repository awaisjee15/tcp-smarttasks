//
//  APIClient.swift
//  SmartTasks
//
//  Created by AwaisSalim on 23/06/2025.
//

import Foundation

class APIClient: APIClientProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        completion: @escaping (Result<T, any Error>) -> Void
    ) {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        session.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
    
}
