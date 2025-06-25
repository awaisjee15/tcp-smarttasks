//
//  APIClientProtocol.swift
//  SmartTasks
//
//  Created by AwaisSalim on 23/06/2025.
//

import Foundation

public protocol APIClientProtocol{
    func request<T: Decodable>(url: URL, method: HTTPMethod, completion: @escaping (Result<T, Error>) -> Void)
}
